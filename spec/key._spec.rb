require_relative 'helper'

describe 'Its Formatter' do
  it 'shows the actual value' do
    expected = <<~S.chomp
      #{Rainbow('ItsSize').red}
        #{Rainbow('its size [:==, 3]').red}
          got Integer
            \e[1;34m2\e[0m
    S

    typ = ItsSize.new [1, 2]
    f = Typ::Formatter.new typ

    expect(f.to_s).to eq expected
  end
end
