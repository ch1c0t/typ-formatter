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
              "#{gate.dsl_method} #{gate.dsl_key.inspect} #{gate.dsl_literal.inspect}"
            else
              "#{gate.dsl_method} #{gate.dsl_literal}"
            end
end

def actual
end

def format
  if gate.ok?
    Rainbow(head).green
  else
    error = gate.error
    string = case error
    when Typ::Error::BadAssertion
      actual_type = "got #{actual.class}".indent 2
      actual_value = actual.ai.indent 4

      actual_type + "\n" + actual_value
    else
      (error.class.to_s.indent 2) + ":\n" + (error.to_s.indent 4)
    end

    Rainbow(head).red + "\n" + string
  end
end
