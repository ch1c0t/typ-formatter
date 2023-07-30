require_relative 'helper'

describe 'a Typ with is_a' do
  it do
    expected = <<~S.chomp
      #{Rainbow('StringTyp').red}
        #{Rainbow('is_a String').red}
          got Symbol
            \e[0;36m:not_string\e[0m
    S

    typ = StringTyp.new :not_string
    f = Typ::Formatter.new typ

    expect(f.to_s).to eq expected
  end
end
