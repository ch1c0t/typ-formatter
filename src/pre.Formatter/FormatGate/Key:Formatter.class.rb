def gotten
  @gotten ||= begin
                error = gate.error

                case error
                when Typ::Error::BadAssertion
                  actual = gate.it[gate.dsl_key]

                  actual_type = "got #{actual.class}".indent 2
                  actual_value = actual.ai.indent 4

                  actual_type + "\n" + actual_value
                else
                  (error.class.to_s.indent 2) + ":\n" + (error.to_s.indent 4)
                end
              end
end
