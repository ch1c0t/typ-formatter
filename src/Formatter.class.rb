require 'string/indent'
require 'rainbow'

def initialize typ
  name = typ.class.name
  @string = if typ.ok?
              Rainbow(name).green
            else
              Rainbow(name).red + "\n" + format_gates_of(typ).indent(2)
            end
end

def to_s
  @string
end

private
  def format_gates_of typ
    typ.gates.map do |gate|
      format_gate gate
    end.join "\n"
  end

  def format_gate gate
    case gate
    when Typ
      self.class.new(gate).to_s
    when Typ::Is::Array
      format_is_array gate
    end
  end

  def format_is_array gate
    string = "is #{gate.to_a}"
    gate.ok? ? Rainbow(string).green : Rainbow(string).red
  end
