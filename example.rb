require_relative 'spec/typs'
require 'typ/formatter'

f = Typ::Formatter.new Positive.new -1
puts f
