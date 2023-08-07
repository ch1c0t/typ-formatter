require_relative 'helper'

describe 'Its Formatter' do
  context 'when some value was returned' do
    it 'shows the actual value' do
      expected = <<~S.chomp
        #{Rainbow('KeyTyp').red}
          #{Rainbow('key "2" [:==, "expected string"]').red}
            got NilClass
              \e[1;31mnil\e[0m
      S

      typ = KeyTyp.new Hash.new
      f = Typ::Formatter.new typ

      expect(f.to_s).to eq expected
    end
  end

  context 'when the short form used' do
    it 'shows the actual value' do
      expected = <<~S.chomp
        #{Rainbow('KeyTypRaw').red}
          #{Rainbow('key "2" "expected string"').red}
            got NilClass
              \e[1;31mnil\e[0m
      S

      typ = KeyTypRaw.new Hash.new
      f = Typ::Formatter.new typ

      expect(f.to_s).to eq expected
    end
  end

  context 'when no such method exists' do
    it 'shows that no such method exists' do
      expected = <<~S.chomp
        #{Rainbow('KeyTyp').red}
          #{Rainbow('key "2" [:==, "expected string"]').red}
            NoMethodError:
              undefined method `[]' for nil:NilClass
      S

      typ = KeyTyp.new nil
      f = Typ::Formatter.new typ

      expect(f.to_s).to eq expected
    end
  end

  context 'when trying to access an Array with a String' do
    it 'shows the TypeError' do
      expected = <<~S.chomp
        #{Rainbow('KeyTyp').red}
          #{Rainbow('key "2" [:==, "expected string"]').red}
            TypeError:
              no implicit conversion of String into Integer
      S

      typ = KeyTyp.new [1, 2]
      f = Typ::Formatter.new typ

      expect(f.to_s).to eq expected
    end
  end
end
