def format
  string = "is_a #{gate.dsl_literal}"

  if gate.ok?
    Rainbow(string).green
  else
    Rainbow(string).red + "\n" + "got #{gate.it.class}".indent(2) + "\n" + gate.it.ai.indent(4)
  end
end
