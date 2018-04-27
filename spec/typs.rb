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
