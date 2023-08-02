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
format StringTyp, :some_symbol

some_hash = {
  a: 1,
  b: 2,
}

format StringTyp, some_hash
format ItsKey, some_hash
format ItsSize, some_hash
