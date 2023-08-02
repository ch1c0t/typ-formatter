def gotten
  @gotten ||= begin
                actual = gate.it.send gate.dsl_key

                actual_type = "got #{actual.class}".indent 2
                actual_value = actual.ai.indent 4

                actual_type + "\n" + actual_value
              end
end
