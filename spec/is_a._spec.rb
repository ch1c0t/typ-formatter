require_relative 'helper'

describe 'a Typ with is_a' do
  it 'works with symbols' do
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

  it 'works with hashes' do
    expected = <<~S.chomp
      #{Rainbow('StringTyp').red}
        #{Rainbow('is_a String').red}
          got Hash
            {
                :a\e[0;37m => \e[0m\e[1;34m1\e[0m,
                :b\e[0;37m => \e[0m\e[1;34m2\e[0m
            }
    S

    some_hash = {
      a: 1,
      b: 2,
    }

    typ = StringTyp.new some_hash
    f = Typ::Formatter.new typ

    expect(f.to_s).to eq expected
  end
end
