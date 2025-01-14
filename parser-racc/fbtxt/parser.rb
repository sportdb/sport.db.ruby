#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.8.1
# from Racc grammar file "parser.y".
#

require 'racc/parser.rb'
class MatchParser < Racc::Parser
##### State transition tables begin ###

racc_action_table = [
    27,    45,    11,    36,    26,    21,    12,    13,    31,    14,
    45,    24,    46,    18,    20,    11,    58,    26,    21,    12,
    13,    46,    14,    32,    24,    52,    18,    20,    37,    42,
    50,    51,    52,    33,    48,    39,    40,    50,    51,    76,
    55,    20,    36,    56,    34,    60,    55,    61,    24,    29,
    30,    65,    66,    78,    79,    83,    84,    63,    67,    68,
    55,    69,    71,    73,    33,    74,    36,    81,    36,    85,
    86,    87,    88,    55,    36,    36,    90 ]

racc_action_check = [
     1,    17,     1,    23,     1,     1,     1,     1,    12,     1,
    41,     1,    17,     1,     1,     0,    23,     0,     0,     0,
     0,    41,     0,    13,     0,    42,     0,     0,    15,    16,
    42,    42,    21,    13,    18,    15,    15,    21,    21,    53,
    21,    18,    14,    22,    14,    24,    53,    27,    14,    11,
    11,    31,    31,    55,    55,    62,    62,    29,    34,    35,
    36,    38,    44,    46,    48,    49,    57,    58,    60,    64,
    67,    68,    72,    76,    80,    82,    88 ]

racc_action_pointer = [
    13,     0,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,    46,     5,    19,    37,    24,    24,    -3,    27,   nil,
   nil,    21,    39,    -2,    27,   nil,   nil,    47,   nil,    52,
   nil,    44,   nil,   nil,    48,    49,    41,   nil,    55,   nil,
   nil,     6,    14,   nil,    58,   nil,    58,   nil,    50,    60,
   nil,   nil,   nil,    27,   nil,    33,   nil,    61,    63,   nil,
    63,   nil,    51,   nil,    65,   nil,   nil,    66,    67,   nil,
   nil,   nil,    60,   nil,   nil,   nil,    54,   nil,   nil,   nil,
    69,   nil,    70,   nil,   nil,   nil,   nil,   nil,    71,   nil,
   nil ]

racc_action_default = [
   -60,   -60,    -1,    -3,    -4,    -5,    -6,    -7,    -8,    -9,
   -10,   -60,   -21,   -30,   -60,   -60,   -60,   -60,   -27,   -29,
   -32,   -60,   -60,   -44,   -60,   -49,   -59,   -60,    -2,   -60,
   -19,   -60,   -17,   -31,   -60,   -60,   -60,   -20,   -60,   -23,
   -24,   -60,   -60,   -26,   -60,   -34,   -60,   -28,   -30,   -60,
   -39,   -40,   -41,   -51,   -52,   -55,   -43,   -60,   -47,   -50,
   -60,    91,   -60,   -12,   -60,   -15,   -16,   -60,   -60,   -22,
   -25,   -33,   -35,   -36,   -38,   -53,   -60,   -56,   -57,   -58,
   -46,   -48,   -45,   -11,   -13,   -14,   -18,   -42,   -60,   -54,
   -37 ]

racc_goto_table = [
    59,    43,    80,    75,     1,    82,     2,    28,    62,    64,
    38,    41,    47,    72,    35,    57,    77,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,    70,    89,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,    59,   nil,    59 ]

racc_goto_check = [
    25,    17,    23,    27,     1,    23,     2,     2,    11,    12,
    14,    16,    18,    20,    22,    24,    28,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,    17,    27,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,    25,   nil,    25 ]

racc_goto_pointer = [
   nil,     4,     6,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   -21,   -22,   nil,    -5,   nil,    -5,   -16,    -6,   nil,
   -33,   nil,     0,   -55,    -8,   -23,   nil,   -50,   -39 ]

racc_goto_default = [
   nil,   nil,   nil,     3,     4,     5,     6,     7,     8,     9,
    10,   nil,   nil,    15,   nil,    16,    17,   nil,    19,    44,
   nil,    49,    22,    23,   nil,    25,    53,    54,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 23, :_reduce_none,
  2, 23, :_reduce_none,
  1, 24, :_reduce_none,
  1, 24, :_reduce_none,
  1, 24, :_reduce_none,
  1, 24, :_reduce_none,
  1, 24, :_reduce_none,
  1, 24, :_reduce_none,
  1, 24, :_reduce_none,
  1, 24, :_reduce_none,
  4, 28, :_reduce_11,
  1, 33, :_reduce_12,
  2, 33, :_reduce_13,
  4, 29, :_reduce_14,
  1, 34, :_reduce_15,
  1, 34, :_reduce_16,
  2, 25, :_reduce_17,
  4, 25, :_reduce_18,
  2, 26, :_reduce_19,
  2, 27, :_reduce_20,
  1, 35, :_reduce_21,
  3, 35, :_reduce_22,
  1, 36, :_reduce_none,
  1, 36, :_reduce_none,
  3, 30, :_reduce_25,
  2, 30, :_reduce_26,
  1, 37, :_reduce_27,
  2, 37, :_reduce_28,
  1, 37, :_reduce_none,
  1, 40, :_reduce_30,
  2, 40, :_reduce_31,
  1, 40, :_reduce_32,
  2, 39, :_reduce_33,
  1, 39, :_reduce_34,
  2, 41, :_reduce_35,
  1, 42, :_reduce_36,
  3, 42, :_reduce_37,
  3, 38, :_reduce_38,
  1, 43, :_reduce_39,
  1, 43, :_reduce_40,
  1, 43, :_reduce_41,
  4, 31, :_reduce_42,
  2, 31, :_reduce_43,
  1, 44, :_reduce_44,
  3, 44, :_reduce_45,
  3, 44, :_reduce_46,
  1, 46, :_reduce_none,
  2, 46, :_reduce_none,
  1, 45, :_reduce_49,
  2, 45, :_reduce_50,
  2, 47, :_reduce_51,
  1, 48, :_reduce_52,
  2, 48, :_reduce_53,
  3, 48, :_reduce_54,
  1, 49, :_reduce_55,
  2, 49, :_reduce_56,
  1, 50, :_reduce_57,
  1, 50, :_reduce_58,
  1, 32, :_reduce_59 ]

racc_reduce_n = 60

racc_shift_n = 91

racc_token_table = {
  false => 0,
  :error => 1,
  :GROUP => 2,
  "|" => 3,
  :NEWLINE => 4,
  :TEXT => 5,
  :ROUND => 6,
  :DATE => 7,
  :DURATION => 8,
  "[" => 9,
  "]" => 10,
  "-" => 11,
  "," => 12,
  :ORD => 13,
  :TIME => 14,
  "@" => 15,
  :SCORE => 16,
  :VS => 17,
  ";" => 18,
  :MINUTE => 19,
  :OG => 20,
  :PEN => 21 }

racc_nt_base = 22

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]
Ractor.make_shareable(Racc_arg) if defined?(Ractor)

Racc_token_to_s_table = [
  "$end",
  "error",
  "GROUP",
  "\"|\"",
  "NEWLINE",
  "TEXT",
  "ROUND",
  "DATE",
  "DURATION",
  "\"[\"",
  "\"]\"",
  "\"-\"",
  "\",\"",
  "ORD",
  "TIME",
  "\"@\"",
  "SCORE",
  "VS",
  "\";\"",
  "MINUTE",
  "OG",
  "PEN",
  "$start",
  "statements",
  "statement",
  "date_header",
  "group_header",
  "round_header",
  "group_def",
  "round_def",
  "match_line",
  "goal_lines",
  "empty_line",
  "team_values",
  "round_date_opts",
  "round_values",
  "round_sep",
  "match_opts",
  "match",
  "more_match_opts",
  "date_opts",
  "geo_opts",
  "geo_values",
  "score_value",
  "goal_lines_body",
  "goals",
  "goal_sep",
  "goal",
  "minutes",
  "minute",
  "minute_opts" ]
Ractor.make_shareable(Racc_token_to_s_table) if defined?(Ractor)

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

# reduce 1 omitted

# reduce 2 omitted

# reduce 3 omitted

# reduce 4 omitted

# reduce 5 omitted

# reduce 6 omitted

# reduce 7 omitted

# reduce 8 omitted

# reduce 9 omitted

# reduce 10 omitted

module_eval(<<'.,.,', 'parser.y', 29)
  def _reduce_11(val, _values, result)
                          @tree << GroupDef.new( name:  val[0],
                                             teams: val[2] )

    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 35)
  def _reduce_12(val, _values, result)
                                                   result = val
                                               ## e.g. val is ["Austria"] 

    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 39)
  def _reduce_13(val, _values, result)
                                                   result.push( val[1] )

    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 48)
  def _reduce_14(val, _values, result)
                          kwargs = { name: val[0] }.merge( val[2] )
                      @tree<< RoundDef.new( **kwargs )

    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 53)
  def _reduce_15(val, _values, result)
     result = { date: val[0] }
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 54)
  def _reduce_16(val, _values, result)
     result = { duration: val[0] }
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 60)
  def _reduce_17(val, _values, result)
                         @tree <<  DateHeader.new( date: val[0] )  

    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 64)
  def _reduce_18(val, _values, result)
                         @tree <<  DateHeader.new( date: val[1] )  

    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 71)
  def _reduce_19(val, _values, result)
                         @tree <<  GroupHeader.new( name: val[0] )  

    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 81)
  def _reduce_20(val, _values, result)
                         @tree <<  RoundHeader.new( names: val[0] )  

    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 84)
  def _reduce_21(val, _values, result)
      result = val
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 85)
  def _reduce_22(val, _values, result)
       result.push( val[2] )
    result
  end
.,.,

# reduce 23 omitted

# reduce 24 omitted

module_eval(<<'.,.,', 'parser.y', 95)
  def _reduce_25(val, _values, result)
                           puts "match:"
                       pp val[1]
                       puts "more match opts:"
                       pp val[2]  

                       kwargs = {}.merge( val[0], val[1], val[2] )
                       @tree << MatchLine.new( **kwargs )

    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 105)
  def _reduce_26(val, _values, result)
                          kwargs = {}.merge( val[0], val[1] )
                      @tree << MatchLine.new( **kwargs )

    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 110)
  def _reduce_27(val, _values, result)
       result = { ord: val[0] }
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 111)
  def _reduce_28(val, _values, result)
       result = { ord: val[0] }.merge( val[1] )
    result
  end
.,.,

# reduce 29 omitted

module_eval(<<'.,.,', 'parser.y', 115)
  def _reduce_30(val, _values, result)
       result = { date: val[0]}
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 116)
  def _reduce_31(val, _values, result)
       result = { date: val[0], time: val[1] }
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 117)
  def _reduce_32(val, _values, result)
       result = { time: val[0]}
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 121)
  def _reduce_33(val, _values, result)
     result = { geo: val[0]}
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 122)
  def _reduce_34(val, _values, result)
     result = {}
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 126)
  def _reduce_35(val, _values, result)
     result = val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 129)
  def _reduce_36(val, _values, result)
      result = val
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 130)
  def _reduce_37(val, _values, result)
      result.push( val[2] )
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 135)
  def _reduce_38(val, _values, result)
                             result = { team1: val[0],
                                    team2: val[2]
                                  }.merge( val[1] )   

    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 140)
  def _reduce_39(val, _values, result)
      result = { score: val[0] }
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 141)
  def _reduce_40(val, _values, result)
      result = {}
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 142)
  def _reduce_41(val, _values, result)
      result = {}
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 159)
  def _reduce_42(val, _values, result)
                           kwargs = val[1]
                       @tree << GoalLine.new( **kwargs )

    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 164)
  def _reduce_43(val, _values, result)
                             kwargs = val[0]
                         @tree << GoalLine.new( **kwargs )

    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 169)
  def _reduce_44(val, _values, result)
      result = { goals1: val[0],
                                                              goals2: [] } 

    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 172)
  def _reduce_45(val, _values, result)
      result = { goals1: [],
                                                              goals2: val[2] } 

    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 175)
  def _reduce_46(val, _values, result)
      result = { goals1: val[0],
                                                              goals2: val[2] }

    result
  end
.,.,

# reduce 47 omitted

# reduce 48 omitted

module_eval(<<'.,.,', 'parser.y', 189)
  def _reduce_49(val, _values, result)
     result = val
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 190)
  def _reduce_50(val, _values, result)
     result.push( val[1])
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 195)
  def _reduce_51(val, _values, result)
                    result = Goal.new( player:  val[0],
                                   minutes: val[1] )   

    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 202)
  def _reduce_52(val, _values, result)
     result = val
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 203)
  def _reduce_53(val, _values, result)
     result.push( val[1])
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 204)
  def _reduce_54(val, _values, result)
     result.push( val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 210)
  def _reduce_55(val, _values, result)
                            ## todo/fix:  assume val[0] is a hash
                        result = Minute.new( minute: val[0] )

    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 215)
  def _reduce_56(val, _values, result)
                            kwargs = { minute: val[0] }.merge( val[1] )
                        result = Minute.new( **kwargs )

    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 219)
  def _reduce_57(val, _values, result)
      result = { og: true }
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 220)
  def _reduce_58(val, _values, result)
      result = { pen: true }
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 225)
  def _reduce_59(val, _values, result)
     puts '  MATCH empty_line'
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

end   # class MatchParser
