
module CatalogDb


## built-in countries for (quick starter) auto-add
class CountryIndex

  def initialize( recs )
    add( recs )
  end

  ## helpers from country - use a helper module for includes (share with clubs etc.) - why? why not?
  include SportDb::NameHelper  ## from sports-struct gem
  
  ## incl. strip_year( name )
  ##       has_year?( name)
  ##       strip_lang( name )
  ##       normalize( name )


  def add( recs )
    ###########################################
    ## auto-fill countries
    ## pp recs
    recs.each do |rec|
      ## rec e.g. { key:'af', code:'AFG', name:'Afghanistan'}     

      ## todo/check: use rec.attributes or such - why? why not?

      country = Model::Country.create!(
              key:       rec.key,
              code:      rec.code,
              name:      rec.name,
              ## use comma for alt names too - why? why not?
              alt_names: rec.alt_names ? rec.alt_names.join( ' | ' ) : nil,
              tags:      rec.tags      ? rec.tags.join( ', ' ) : nil,
       ) 
       pp country
    
      ## add codes lookups - key, code, ...
      Model::CountryCode.create!( country_id: country.id, 
                                  code:        rec.key )

      ## add  code (only) if different from key
      if rec.key != rec.code.downcase
        Model::CountryCode.create!( country_id: country.id, 
                                    code:        rec.code.downcase )
      end
       
      ##  add all names (canonical name + alt names
      names = [rec.name] + rec.alt_names
      more_names = []
      ## check "hand-typed" names for year (auto-add)
      ## check for year(s) e.g. (1887-1911), (-2013),
      ##                        (1946-2001,2013-) etc.
      names.each do |name|
        if has_year?( name )
          more_names <<  strip_year( name )
        end
      end

      names += more_names
      ## check for duplicates - simple check for now - fix/improve
      ## todo/fix: (auto)remove duplicates - why? why not?
      count      = names.size
      count_uniq = names.uniq.size
      if count != count_uniq
        puts "** !!! ERROR !!! - #{count-count_uniq} duplicate name(s):"
        pp names
        pp rec
        exit 1
      end

      names.each do |name|
        ## check lang codes e.g. [en], [fr], etc.
        ##  todo/check/fix:  move strip_lang up in the chain - check for duplicates (e.g. only lang code marker different etc.) - why? why not?
        name = strip_lang( name )
        norm = normalize( name )

        Model::CountryName.create!( country_id: country.id, 
                                    name:       norm )
      end
    end  ## each record
  end # method initialize


end # class CountryIndex
end   # module CatalogDb
