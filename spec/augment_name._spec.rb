require_relative 'helper'

describe 'printing augmented names' do
  let(:instance) {
    Class.new do
      include Typ
      is [:>, 0]
    end.new 0
  }

  it do
    instance.name = instance.name + ' pose some_location.rb:12'
    string = Typ::Formatter.new(instance).to_s
    line = string.lines.first

    expect(line).to start_with "\e[31m#<Class:"
    expect(line).to end_with " pose some_location.rb:12\e[0m\n"
  end
end
