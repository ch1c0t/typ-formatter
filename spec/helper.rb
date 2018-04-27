require 'typ/formatter'

require 'rspec/power_assert'
RSpec::PowerAssert.example_assertion_alias :assert
RSpec::PowerAssert.example_group_assertion_alias :assert

require_relative 'typs'

RSpec.configure do |config|
  unless ENV['PRY']
    require 'timeout'

    config.around :each do |example|
      Timeout.timeout 5, &example
    end
  end
end
