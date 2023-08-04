def initialize gate
  @gate = gate
  @string = format
end

attr_reader :gate

def to_s
  @string
end

def head
  @head ||= if gate.dsl_key
              "#{gate.dsl_method} #{gate.dsl_key.inspect} #{gate.dsl_literal}"
            else
              "#{gate.dsl_method} #{gate.dsl_literal}"
            end
end

def gotten
  @gotten ||= "got #{gate.it.class}".indent(2) + "\n" + gate.it.ai.indent(4)
end

def format
  if gate.ok?
    Rainbow(head).green
  else
    Rainbow(head).red + "\n" + gotten
  end
end
