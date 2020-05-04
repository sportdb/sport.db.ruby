# encoding: utf-8

module SportDb
  module Sync


  class NationalTeam
    def self.find_or_create( team )
      rec = Model::Team.find_by( title: team.name )
      if rec.nil?
        puts "add national team: #{team.key}, #{team.name}, #{team.country.name} (#{team.country.key})"

        ### note: key expected three or more lowercase letters a-z /\A[a-z]{3,}\z/
        attribs = {
          key:        team.key,   ## note: always use downcase fifa code for now!!!
          title:      team.name,
          code:       team.code,
          country_id: Sync::Country.find_or_create( team.country ).id,
          club:       false,
          national:   true  ## check -is default anyway - use - why? why not?
        }

        if team.alt_names.empty? == false
          attribs[:synonyms] = team.alt_names.join('|')
        end

        rec = Model::Team.create!( attribs )
      end
      rec
    end
  end # class NationalTeam


  class Team
    ## auto-cache all clubs by find_or_create for later mapping / lookup
    def self.cache() @cache ||= {}; end

    def self.find_or_create( team_or_teams )
      if team_or_teams.is_a?( Array )
        recs = []
        teams = team_or_teams
        teams.each do |team|
          recs << __find_or_create( team )
        end
        recs
      else  # assome single rec
        team = team_or_teams
        __find_or_create( team )
      end
    end

    def self.__find_or_create( team )  ## todo/check: use find_or_create_worker instead of _find - why? why not?
       rec = if team.is_a?( Import::NationalTeam )
               NationalTeam.find_or_create( team )
             else ## assume Club
               Club.find_or_create( team )
             end
       cache[ team.name ] = rec    ## note: assume "canonical" unique team name
       rec
    end
  end # class Team



  class Round
    def self.find_or_create( round, event: )
       rec = Model::Round.find_by( title: round.title, event_id: event.id )
       if rec.nil?
         attribs = { event_id: event.id,
                     title:    round.title,
                     pos:      round.pos,
                     start_at: event.start_at.to_date
                   }
         rec = Model::Round.create!( attribs )
       end
       rec
    end
  end # class Round


  class Group
    def self.find_or_create( group, event: )
       rec = Model::Group.find_by( title: group.title, event_id: event.id )
       if rec.nil?
         attribs = { event_id: event.id,
                     title:    group.title,
                     pos:      group.pos
                   }
         rec = Model::Group.create!( attribs )
       end
       ## todo/fix: add/update teams in group too!!!!!
       rec
    end
  end # class Group


  class Stage
    def self.find( name, event: )
      Model::Stage.find_by( title: name, event_id: event.id  )
    end
    def self.find!( name, event: )
      rec = find( name, event: event  )
      if rec.nil?
        puts "** !!!ERROR!!! db sync - no stage match found for:"
        pp name
        pp event
        exit 1
      end
      rec
    end

    def self.find_or_create( name, event: )
       rec = find( name, event: event )
       if rec.nil?
         ## use title and not name - why? why not?
         ##  quick fix:  change name to title
         attribs = { event_id: event.id,
                     title:    name,
                   }
         rec = Model::Stage.create!( attribs )
       end
       rec
    end
  end # class Stage



  class Match   ## todo/check:  add alias for Game class - why? why not?
    def self.create_or_update( match, event: )
       ## note: MUST find round, thus, use bang (!)

       ## todo/check: allow strings too - why? why not?

       ## query for round - allow string or round rec
       round_title = match.round.is_a?( String ) ? match.round : match.round.title
       round_rec   = Model::Round.find_by!( event_id: event.id,
                                            title:    round_title )

       ## todo/check: allow fallback with db lookup if NOT found in cache - why? why not?
       ##  or better use Sync::Team.find_or_create( team )  !!!!!!! to auto-create on first hit!
       ##    || Team.find_or_create( team1 )  -- note: does NOT work for string (only recs) - what to do?
       ##    || Model::Team.find_by!( title: team1_name )
       team1_name   = match.team1.is_a?( String ) ? match.team1 : match.team1.name
       team1_rec    = Team.cache[ team1_name ]
       team2_name   = match.team2.is_a?( String ) ? match.team2 : match.team2.name
       team2_rec    = Team.cache[ team2_name ]

       ## check optional group (e.g. Group A, etc.)
       group_rec = if match.group
                     group_title = match.group.is_a?( String ) ? match.group : match.group.title
                     Model::Group.find_by!( event_id: event.id,
                                            title:    group_title )
                   else
                     nil
                   end


       rec = Model::Game.find_by( round_id: round_rec.id,
                                  team1_id: team1_rec.id,
                                  team2_id: team2_rec.id )
       if rec.nil?
         attribs = { round_id: round_rec.id,
                     team1_id: team1_rec.id,
                     team2_id: team2_rec.id,
                     pos:      999,    ## make optional why? why not? - change to num?
                     play_at:  match.date.to_date,
                     score1:   match.score1,
                     score2:   match.score2,
                     score1i:  match.score1i,
                     score2i:  match.score2i }
         attribs[ :group_id ] = group_rec.id   if group_rec

         rec = Model::Game.create!( attribs )
       else
         # update - todo
       end
       rec
    end
  end # class Match

end # module Sync
end # module SportDb
