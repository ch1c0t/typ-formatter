require 'ap'

using ToPascalCase

def format_gate gate
  if gate.is_a? Typ
    Typ::Formatter.new gate
  else
    FormatGate
      .const_get(gate.dsl_method.to_pascal_case)
      .new(gate).to_s
  end
end
