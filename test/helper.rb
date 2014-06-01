
## $:.unshift(File.dirname(__FILE__))

## minitest setup

# require 'minitest/unit'
require 'minitest/autorun'


## our own code

require 'sportdb'


#####################
# Models shortcuts

Country    = WorldDb::Model::Country

Person     = PersonDb::Model::Person

League     = SportDb::Model::League
Season     = SportDb::Model::Season
Event      = SportDb::Model::Event
Team       = SportDb::Model::Team
Roster     = SportDb::Model::Roster
Assoc      = SportDb::Model::Assoc

Round      = SportDb::Model::Round
Group      = SportDb::Model::Group
Game       = SportDb::Model::Game
GameCursor = SportDb::Model::GameCursor


EventStanding        = SportDb::Model::EventStanding
EventStandingEntry   = SportDb::Model::EventStandingEntry
GroupStanding        = SportDb::Model::GroupStanding
GroupStandingEntry   = SportDb::Model::GroupStandingEntry
AlltimeStanding      = SportDb::Model::AlltimeStanding
AlltimeStandingEntry = SportDb::Model::AlltimeStandingEntry



####################
# Reader shortcuts

Reader             = SportDb::Reader
TeamReader         = SportDb::TeamReader
AssocReader        = SportDb::AssocReader
SeasonReader       = SportDb::SeasonReader
LeagueReader       = SportDb::LeagueReader
GameReader         = SportDb::GameReader
NationalTeamReader = SportDb::NationalTeamReader
RaceTeamReader     = SportDb::RaceTeamReader

PersonReader       = PersonDb::PersonReader

#################################
# setup db -> schema / tables

SportDb.setup_in_memory_db

