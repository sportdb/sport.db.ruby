

####
# try a (simple) tokenizer/parser with regex

## note - match line-by-line
#            avoid massive backtracking by definition
#             that is, making it impossible

## sym(bols) -
##  text - change text to name - why? why not?



require_relative 'parser/token-score'
require_relative 'parser/token-date'
require_relative 'parser/token-text'
require_relative 'parser/token'
require_relative 'parser/lang'
require_relative 'parser/parser'


## more
require_relative 'parser/outline_reader'
require_relative 'parser/linter'
require_relative 'parser/opts'


###
#  make parser api (easily) available - why? why not?

=begin
module SportDb
   def self.parser() @@parser ||= Parser.new; end
   def self.parse( ... ) 
   end
   def self.tokenize( ... )
   end
end  # module SportDb
=end





