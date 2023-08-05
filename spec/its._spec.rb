require_relative 'helper'

describe 'Its Formatter' do
  context 'when some value was returned' do
    it 'shows the actual value' do
      expected = <<~S.chomp
        #{Rainbow('ItsSize').red}
          #{Rainbow('its :size [:==, 3]').red}
            got Integer
              \e[1;34m2\e[0m
      S

      typ = ItsSize.new [1, 2]
      f = Typ::Formatter.new typ

      expect(f.to_s).to eq expected
    end
  end

  context 'when no such method exists' do
    it 'shows that no such method exists' do
      expected = <<~S.chomp
        #{Rainbow('ItsSize').red}
          #{Rainbow('its :size [:==, 3]').red}
            NoMethodError:
              undefined method `size' for nil:NilClass
      S

      typ = ItsSize.new nil
      f = Typ::Formatter.new typ

      expect(f.to_s).to eq expected
    end
  end
end
