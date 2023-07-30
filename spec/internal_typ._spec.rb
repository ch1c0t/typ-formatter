require_relative 'helper'

describe 'a Typ containing an internal Typ' do
  it do
    expected = <<~S.chomp
      #{Rainbow('WithInternalTyp').red}
        #{Rainbow('is [:>, 0]').green}
        #{Rainbow('BiggerAndSmallerThanZero').red}
          #{Rainbow('is [:>, 0]').green}
          #{Rainbow('is [:<, 0]').red}
    S

    typ = WithInternalTyp.new 1
    f = Typ::Formatter.new typ

    expect(f.to_s).to eq expected
  end
end
