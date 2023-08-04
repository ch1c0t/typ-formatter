def gotten
  @gotten ||= begin
                case gate.error
                when NoMethodError
                  gate.error.to_s.indent 2
                else
                  actual = gate.it.send gate.dsl_key

                  actual_type = "got #{actual.class}".indent 2
                  actual_value = actual.ai.indent 4

                  actual_type + "\n" + actual_value
                end
              end
end
