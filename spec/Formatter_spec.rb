require_relative 'helper'

describe Typ::Formatter do
  context 'a Typ with one gate' do
    it 'prints green constant name' do
      typ = Positive.new 1
      f = Typ::Formatter.new typ
      one_green_line = "\e[32mPositive\e[0m"
      assert { f.to_s == one_green_line }
    end

    it 'prints red constant name and the failed gate' do
      typ = Positive.new -1
      f = Typ::Formatter.new typ
      two_red_lines = "\e[31mPositive\e[0m\n  \e[31mis [:>, 0]\e[0m"
      assert { f.to_s == two_red_lines }
    end
  end

  context 'a Typ containing an internal Typ' do
    it 'works' do
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

  context 'a Typ with is_a' do
    it do
      expected = <<~S.chomp
        #{Rainbow('StringTyp').red}
          #{Rainbow('is_a String').red}
            got Symbol
      S

      typ = StringTyp.new :not_string
      f = Typ::Formatter.new typ

      expect(f.to_s).to eq expected
    end
  end
end
