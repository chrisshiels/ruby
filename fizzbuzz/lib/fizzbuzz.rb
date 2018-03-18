# 'lib/fizzbuzz.rb'.
# Chris Shiels.


class FizzBuzz
  def self.fizzbuzz(n)
    if n % 3 == 0 && n % 5 == 0
      'fizzbuzz'
    elsif n % 3 == 0
      'fizz'
    elsif n % 5 == 0
      'buzz'
    else
      n
    end
  end
 
  def initialize(maxn)
    @maxn = maxn
  end

  def each()
    1.upto(@maxn) { | i | yield FizzBuzz.fizzbuzz(i) }
  end

  include Enumerable
end
