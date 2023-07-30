require 'string/indent'
require 'rainbow'

def initialize typ
  k = typ.class
  @string = if typ.ok?
              Rainbow(k).green
            else
              Rainbow(k).red + "\n" + format_gates_of(typ).indent(2)
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
