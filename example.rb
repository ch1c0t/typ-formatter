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
format ItsSize, nil
format KeyTyp, some_hash

format ItsSizeRaw, some_hash
format ItsSizeRaw, nil
format KeyTypRaw, some_hash

c = Class.new do
  include Typ
  is [:>, 0]
end
format c, 0

instance = c.new 0
instance.name = instance.name + ' pose some_location.rb:12'
puts Typ::Formatter.new instance
