require 'ap'

def format_gate gate
  case gate
  when Typ
    Formatter.new gate
  when Is::Array
    format_is_array gate
  when IsA
    format_is_a gate
  end
end

def format_is_array gate
  string = "is #{gate.to_a}"
  gate.ok? ? Rainbow(string).green : Rainbow(string).red
end

def format_is_a gate
  is_a = "is_a #{gate.class.check}"

  if gate.ok?
    Rainbow(is_a).green
  else
    Rainbow(is_a).red + "\n" + "got #{gate.it.class}".indent(2) + "\n" + gate.it.ai.indent(4)
  end
end
