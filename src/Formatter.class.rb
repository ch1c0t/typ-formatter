require 'string/indent'
require 'rainbow'

def initialize typ
  n = typ.name
  @string = if typ.ok?
              Rainbow(n).green
            else
              Rainbow(n).red + "\n" + format_gates_of(typ).indent(2)
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

  include FormatGate
