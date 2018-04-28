require_relative 'spec/typs'
require 'typ/formatter'

def format typ, it
  puts Typ::Formatter.new typ.new it
  puts '=================='
  2.times { puts }
end

format Positive, -1
format BiggerAndSmallerThanZero, 1
format WithInternalTyp, 1
