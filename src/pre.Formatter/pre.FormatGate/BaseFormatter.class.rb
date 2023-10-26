def initialize gate
  @gate = gate
  @string = format
end

attr_reader :gate

def to_s
  @string
end
