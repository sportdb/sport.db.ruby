#######
# test search (struct convenience) helpers/methods

## note: use the local version of gems
$LOAD_PATH.unshift( File.expand_path( '../parser/lib' ))
$LOAD_PATH.unshift( File.expand_path( '../score-formats/lib' ))
$LOAD_PATH.unshift( File.expand_path( '../sportdb-structs/lib' ))
$LOAD_PATH.unshift( File.expand_path( './lib' ))


## our own code
require 'sportdb/quick'


OPENFOOTBALL_PATH = '../../../openfootball'


## SportDb::MatchParser.debug = true
SportDb::MatchParser.debug = true
SportDb::QuickMatchReader.debug = true


# path =  "#{OPENFOOTBALL_PATH}/champions-league/2024-25/cl.txt"
path =  "#{OPENFOOTBALL_PATH}/champions-league/2022-23/cl.txt"

matches = SportDb::QuickMatchReader.read( path )
## pp matches

puts
puts "  try json for matches:"
data = matches.map {|match| match.as_json }
pp data

puts "bye"