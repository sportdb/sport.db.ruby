
module SportDb
  class Package

    CONF_RE = %r{  (?: ^|/ )               # beginning (^) or beginning of path (/)
        \.conf\.txt$
    }x

    LEAGUES_RE = %r{  (?: ^|/ )               # beginning (^) or beginning of path (/)
       (?: [a-z]{1,4}\. )?   # optional country code/key e.g. eng.clubs.wiki.txt
        leagues\.txt$
    }x

    CLUBS_RE = %r{  (?: ^|/ )               # beginning (^) or beginning of path (/)
       (?: [a-z]{1,4}\. )?   # optional country code/key e.g. eng.clubs.txt
        clubs\.txt$
    }x

    CLUBS_WIKI_RE = %r{  (?:^|/)               # beginning (^) or beginning of path (/)
        (?:[a-z]{1,4}\.)?   # optional country code/key e.g. eng.clubs.wiki.txt
       clubs\.wiki\.txt$
    }x

    CLUB_PROPS_RE = %r{  (?: ^|/ )               # beginning (^) or beginning of path (/)
      (?: [a-z]{1,4}\. )?   # optional country code/key e.g. eng.clubs.props.txt
        clubs\.props\.txt$
    }x

    ## note: if pattern includes directory add here
    ##     (otherwise move to more "generic" datafile) - why? why not?
    MATCH_RE = %r{ /(?: \d{4}-\d{2}        ## season folder e.g. /2019-20
                      | \d{4}(--[^/]+)?    ## season year-only folder e.g. /2019 or /2016--france
                    )
                   /[a-z0-9_-]+\.txt$  ## txt e.g /1-premierleague.txt
                }x

    ## move class-level "static" finders to DirPackage (do NOT work for now for zip packages) - why? why not?

    def self.find( path, pattern )
      datafiles = []

      ## check all txt files
      ## note: incl. files starting with dot (.)) as candidates (normally excluded with just *)
      candidates = Dir.glob( "#{path}/**/{*,.*}.txt" )
      pp candidates
      candidates.each do |candidate|
        datafiles << candidate    if pattern.match( candidate )
      end

      pp datafiles
      datafiles
   end



   def self.find_clubs( path, pattern: CLUBS_RE )            find( path, pattern ); end
   def self.find_clubs_wiki( path, pattern: CLUBS_WIKI_RE )  find( path, pattern ); end

   def self.match_clubs( path )       CLUBS_RE.match( path ); end
   def self.match_clubs_wiki( path )  CLUBS_WIKI_RE.match( path ); end
   def self.match_club_props( path, pattern: CLUB_PROPS_RE ) pattern.match( path ); end
   class << self
     alias_method :match_clubs?, :match_clubs
     alias_method :clubs?,       :match_clubs

     alias_method :match_clubs_wiki?, :match_clubs_wiki
     alias_method :clubs_wiki?,       :match_clubs_wiki

     alias_method :match_club_props?, :match_club_props
     alias_method :club_props?,       :match_club_props
   end


   def self.find_leagues( path, pattern: LEAGUES_RE )  find( path, pattern ); end
   def self.match_leagues( path )  LEAGUES_RE.match( path ); end
   class << self
     alias_method :match_leagues?, :match_leagues
     alias_method :leagues?,       :match_leagues
   end


   def self.find_conf( path, pattern: CONF_RE )  find( path, pattern ); end
   def self.match_conf( path )  CONF_RE.match( path ); end
   class << self
     alias_method :match_conf?, :match_conf
     alias_method :conf?,       :match_conf
   end



    attr_reader :pack     ## allow access to embedded ("low-level") delegate package (or hide!?) - why? why not?

    def initialize( path_or_pack )
      if path_or_pack.is_a?( Datafile::Package )
        @pack = path_or_pack
      else   ## assume it's a (string) path
        path = path_or_pack
        if !File.exist?( path )  ## file or directory
          puts "** !!! ERROR !!! file NOT found >#{path}<; cannot open package"
          exit 1
        end

        if File.directory?( path )
          @pack = Datafile::DirPackage.new( path )     ## delegate to "generic" package
        elsif File.file?( path ) && File.extname( path ) == '.zip'  # note: includes dot (.) eg .zip
          @pack = Datafile::ZipPackage.new( path )
        else
          puts "** !!! ERROR !!! cannot open package - directory or file with .zip extension required"
          exit 1
        end
      end
    end

    def each_conf( &blk )       @pack.each( pattern: CONF_RE, &blk ); end
    def each_match( &blk )      @pack.each( pattern: MATCH_RE, &blk ); end
    def each_club_props( &blk ) @pack.each( pattern: CLUB_PROPS_RE, &blk ); end

    def each_leagues( &blk )    @pack.each( pattern: LEAGUES_RE, &blk ); end
    def each_clubs( &blk )      @pack.each( pattern: CLUBS_RE, &blk ); end
  end   # class Package


  class DirPackage < Package
    def initialize( path )   super( Datafile::DirPackage.new( path ) ); end
  end

  class ZipPackage < Package
    def initialize( path )   super( Datafile::ZipPackage.new( path ) ); end
  end
end   # module SportDb
