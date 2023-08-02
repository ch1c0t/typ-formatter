require 'typ'

class Positive
  include Typ
  is [:>, 0]
end

class BiggerAndSmallerThanZero
  include Typ
  
  is [:>, 0]
  is [:<, 0]
end

class WithInternalTyp
  include Typ

  is [:>, 0]
  is BiggerAndSmallerThanZero
end

class StringTyp
  include Typ

  is_a String
end

class ItsKey
  include Typ

  its :size, [:==, 3]
  key 2, [:==, 'some string']
end

class ItsSize
  include Typ
  its :size, [:==, 3]
end
