def format gate
  literal = gate.dsl_literal

  case literal
  when Array
    string = "is #{literal}"
    gate.ok? ? Rainbow(string).green : Rainbow(string).red
  end
end
