# encoding: utf-8

module SportDb
  module Import


class WikiIndex

  def self.build( path )
    recs = []
    datafiles = Configuration.find_datafiles_clubs_wiki( path )
    datafiles.each do |datafile|
        recs += WikiReader.read( datafile )
    end
    recs

    self.new( recs )
  end

  def initialize( recs )
    @pages_by_country = {}

    ## todo/fix:
    ##   check for duplicate recs - report and exit on dupliate!!!!!!
    recs.each do |rec|
      h = @pages_by_country[ rec.country.key ] ||= {}
      h[ normalize(rec.name) ] = rec
    end
  end


  def normalize( name )
    ## todo/fix:  (re)use normalize from Club!!!!
    name = name.gsub( /[\-\.]/, '' )
    name = name.gsub( ' ', '' )    ## remove spaces too
    name = name.downcase
    name
  end



  def find_by( club: )    ## todo/check: use find_by_club - why? why not?
    find_by_club( club )
  end

  def find_by_club( club )
    rec = nil

    ## get query params from club
    names   = [club.name]+club.alt_names
    country_key = club.country.key

    h = @pages_by_country[ country_key ]
    if h
      ## todo/check: sort names ?
      ##   sort by longest first (for best match)
      names.each do |name|
        ## todo/fix:  name - remove/string year and lang e.g. (1946-2001), [en]!!!!
        rec = h[ normalize( name ) ]
        break if rec   ## bingo!! found - break on first match
      end
    end

    rec  ## note: return nil if nothing found
  end
end  # class WikiIndex


end   # module Import
end   # module SportDb