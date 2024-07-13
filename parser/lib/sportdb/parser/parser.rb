####
# try a (simple) tokenizer/parser with regex

## note - match line-by-line
#            avoid massive backtracking by definition
#             that is, making it impossible

## sym(bols) -
##  text - change text to name - why? why not?





##
#  keep 18h30 - why? why not?
#    add support for 6:30pm 8:20am etc. - why? why not?

TIME_RE = %r{
    ## e.g. 18.30 (or 18:30 or 18h30)
    (?<time>  \b
              \d{1,2}
              (?: :|\.|h )
               \d{2}
              \b
    )     
}ix



##
# for timezone format use for now:
# (BRT/UTC-3)      (e.g. brazil time)
#
# (CET/UTC+1)   - central european time
# (CEST/UTC+2)  - central european summer time  - daylight saving time (DST).
# (EET/UTC+1)  - eastern european time
# (EEST/UTC+2)  - eastern european summer time  - daylight saving time (DST).
# 
# UTC+3
# UTC+4
# UTC+0
# UTC+00
# UTC+0000
#
#  - allow +01 or +0100  - why? why not
#  -       +0130 (01:30)
#
# see
#   https://en.wikipedia.org/wiki/Time_zone
#   https://en.wikipedia.org/wiki/List_of_UTC_offsets
#   https://en.wikipedia.org/wiki/UTC−04:00  etc.

TIMEZONE_RE = %r{
   ## e.g. (UTC-2) or (CEST/UTC-2) etc.
   (?<timezone>  
      \(
           ## optional "local" timezone name eg. BRT or CEST etc.
           (?:  [a-z]+
                 /
           )?
            [a-z]+
            [+-]
            \d{1,4}   ## e.g. 0 or 00 or 0000
      \)
   )
}ix




BASICS_RE = %r{
    ## e.g. (51) or (1) etc.  - limit digits of number???
    (?<num> \(\d+\) )    
       |
    (?<vs>   
       (?<=[ ])	# Positive lookbehind for space	
       (?: 
          vs\.?|   ## allow optional dot (eg. vs. v.)
          v\.?|
          -
       )   # not bigger match first e.g. vs than v etc.
       (?=[ ])   # positive lookahead for space
    ) 
       | 
    (?<none>
       (?<=[ \[]|^)	 # Positive lookbehind for space or [	
           -
        (?=[ ]*;)   # positive lookahead for space
    )
       |
    (?<spaces> [ ]{2,}) |
    (?<space>  [ ]) 
        |
    (?<sym>[;,@|\[\]]) 
}ix


MINUTE_RE = %r{
     (?<minute>
       (?<=[ ])	 # Positive lookbehind for space required
        \d{1,3}    ## constrain numbers to 0 to 999!!!
        (?: \+
            \d{1,3}
        )? 	
        '       ## must have minute marker!!!!
     )
}ix


##  (match) status 
##    note: english usage - cancelled (in UK), canceled (in US)
##
##  add more variants - why? why not?

STATUS_RE = %r{
     (?<status>
         \b
         (?:
            cancelled|canceled|can\.
               |
            abandoned|abd\.
               |
            postponed
               |
            awarded|awd\. 
               |
            replay     
         )
   (?=[ \]]|$)
     )}ix

## todo/check:  remove loakahead assertion here - why require space?
## note: \b works only after non-alphanum  
##          to make it work with awd. (dot) "custom" lookahead neeeded 


##   goal types
# (pen.) or (pen) or (p.) or (p)  
## (o.g.) or (og)
GOAL_PEN_RE = %r{
   (?<pen> \(  
           (?:pen|p)\.? 
           \)
    )
}ix
GOAL_OG_RE = %r{
   (?<og> \(  
          (?:og|o\.g\.) 
          \)
   )
}ix




RE = Regexp.union(   STATUS_RE,
                     TIMEZONE_RE,
                     TIME_RE,
                     DURATION_RE,  # note - duration MUST match before date
                    DATE_RE,
                    SCORE_RE,
                    BASICS_RE, MINUTE_RE,
                    GOAL_OG_RE, GOAL_PEN_RE,
                     TEXT_RE )


def log( msg )
   ## append msg to ./logs.txt  
   ##     use ./errors.txt - why? why not?
   File.open( './logs.txt', 'a:utf-8' ) do |f|
     f.write( msg )
     f.write( "\n" ) 
   end
end



def tokenize_with_errors( line, debug: false )
  tokens = []
  errors = []   ## keep a list of errors - why? why not?

  puts ">#{line}<"    if debug

  pos = 0
  ## track last offsets - to report error on no match 
  ##   or no match in end of string
  offsets = [0,0]
  m = nil

  while m = RE.match( line, pos )
    if debug
      pp m
      puts "pos: #{pos}"  
    end
    offsets = [m.begin(0), m.end(0)]

    if offsets[0] != pos
      ## match NOT starting at start/begin position!!!
      ##  report parse error!!!
      msg =  "!! WARN - parse error - skipping >#{line[pos..(offsets[0]-1)]}< @#{offsets[0]},#{offsets[1]} in line >#{line}<"
      puts msg

      errors << "parse error - skipping >#{line[pos..(offsets[0]-1)]}< @#{offsets[0]},#{offsets[1]}"
      log( msg )
    end

    ##
    ## todo/fix - also check if possible
    ##   if no match but not yet end off string!!!!
    ##    report skipped text run too!!!

    pos = offsets[1]

    pp offsets   if debug

    t = if m[:space]
           ## skip space
           nil
        elsif m[:spaces]
           ## skip spaces
           nil
        elsif m[:status]   ## (match) status e.g. cancelled, awarded, etc.
          [:status, m[:status]]   
        elsif m[:text] 
          [:text, m[:text]]   ## keep pos - why? why not?
        elsif m[:date]
          [:date, m[:date]]
        elsif m[:time]
          [:time, m[:time]]
        elsif m[:timezone]
          [:timezone, m[:timezone]]
        elsif m[:duration]
          [:duration, m[:duration]]
        elsif m[:num]
          [:num, m[:num]]
        elsif m[:score]
          [:score, m[:score]]
        elsif m[:minute]
          [:minute, m[:minute]]
        elsif m[:og]
          [:og, m[:og]]
        elsif m[:pen]
          [:pen, m[:pen]]
        elsif m[:vs]
          [:vs, m[:vs]]
        elsif m[:none]
          [:none, m[:none]]
        elsif m[:sym]
          sym = m[:sym]
          ## return symbols "inline" as is - why? why not?
          case sym
          when ',' then [:',']
          when ';' then [:';']
          when '@' then [:'@']
          when '|' then [:'|']   
          else
            nil  ## ignore others (e.g. brackets [])
          end
        else
          ## report error 
          nil
        end

    tokens << t    if t    

    if debug
      print ">"
      print "*" * pos
      puts "#{line[pos..-1]}<"
    end
  end

  ## check if no match in end of string
  if offsets[1] != line.size
    msg =  "!! WARN - parse error - skipping >#{line[offsets[1]..-1]}< @#{offsets[1]},#{line.size} in line >#{line}<"
    puts msg
    log( msg )

    errors << "parse error - skipping >#{line[offsets[1]..-1]}< @#{offsets[1]},#{line.size}"
  end


  [tokens,errors] 
end


### convience helper - ignore errors by default
def tokenize(  line, debug: false )
   tokens, _ = tokenize_with_errors( line, debug: debug )
   tokens
end
