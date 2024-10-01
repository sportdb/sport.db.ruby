## note: sportdb/catalogs pulls in sportdb/structs and footballdb/data
require 'sportdb/catalogs'



## our own code
require_relative 'search/version'

###
##   add/augment core classes with search services
require_relative 'search/sport'
require_relative 'search/world'



#######
## add configuration
module SportDb
module Import
class Configuration
  ###
  #  find a better name for setting - why? why not?
  #     how about catalogdb or ???
  attr_reader   :catalog_path
  def catalog_path=(path)
      @catalog_path = path
      ########
      # reset database here to new path
      CatalogDb::Metal::Record.database = path
      @catalog_path
  end

  ###
  #  find a better name for setting - why? why not?
  #     how about playersdb or ???
  attr_reader   :players_path
  def players_path=(path)
      @players_path = path
      ########
      # reset database here to new path
      CatalogDb::Metal::PlayerRecord.database = path

      @players_path
  end


end # class Configuration


      ## lets you use
      ##   SportDb::Import.configure do |config|
      ##      config.catalog_path = './catalog.db'
      ##   end
    def self.configure()  yield( config ); end
    def self.config()  @config ||= Configuration.new;  end
end   # module Import
end   # module SportDb


module Sports
    ## note: just forward to SportDb::Import configuration!!!!!
    ##  keep Sports module / namespace "clean" - why? why not?
    ##    that is, only include data structures (e.g. Match,League,etc) for now - why? why not?
    def self.configure()  yield( config ); end
    def self.config()  SportDb::Import.config; end
end   # module Sports



###
# more to be done


module SportDb
  module Import
    class Team
      ## add convenience lookup helper / method for name by season for now
      ##   use clubs history - for now kept separate from struct - why? why not?
      def name_by_season( season )
        ## note: returns / fallback to "regular" name if no records found in history
        SportDb::Import.catalog.clubs_history.find_name_by( name: name, season: season ) || name
      end
    end  # class Team
  end   # module Import
end     # module SportDb


###
## add default/built-in catalog here - why? why not?
##  todo/fix  - set catalog_path on demand
##   note:  for now required for world search setup etc.
## SportDb::Import.config.catalog_path = "#{FootballDb::Data.data_dir}/catalog.db"
##
##  note - for now set as default upstream in sportdb-catalogs!!!


puts SportDb::Module::Search.banner   # say hello

