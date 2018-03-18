# 'spec/fizzbuzz_spec.rb'.
# Chris Shiels.


require 'fizzbuzz.rb'


RSpec.describe FizzBuzz do
  describe '#fizzbuzz' do
    it 'should fizzbuzz' do
      expect(1.upto(20)
              .collect { | e | FizzBuzz.fizzbuzz(e) })
              .to eql([ 1,
                        2,
                        'fizz',
                        4,
                        'buzz',
                        'fizz',
                        7,
                        8,
                        'fizz',
                        'buzz',
                        11,
                        'fizz',
                        13,
                        14,
                        'fizzbuzz',
                        16,
                        17,
                        'fizz',
                        19,
                        'buzz' ])
    end
  end

  describe '#instantiate' do
    it 'should instantiate' do
      fizzbuzz = FizzBuzz.new(20)
      expect(fizzbuzz).not_to eql(nil)
    end
  end

  describe '#entries' do
    it 'should return entries' do
      fizzbuzz = FizzBuzz.new(20)
      expect(fizzbuzz.entries).to eql([ 1,
                                        2,
                                        'fizz',
                                        4,
                                        'buzz',
                                        'fizz',
                                        7,
                                        8,
                                        'fizz',
                                        'buzz',
                                        11,
                                        'fizz',
                                        13,
                                        14,
                                        'fizzbuzz',
                                        16,
                                        17,
                                        'fizz',
                                        19,
                                        'buzz' ])
    end
  end

  describe '#select' do
    it 'should return selections' do
      fizzbuzz = FizzBuzz.new(20)
      expect(fizzbuzz.select { | e | e == 'fizzbuzz' }.size).to eql(1)
      expect(fizzbuzz.select { | e | e == 'fizz' }.size).to eql(5)
      expect(fizzbuzz.select { | e | e == 'buzz' }.size).to eql(3)
    end
  end
end
