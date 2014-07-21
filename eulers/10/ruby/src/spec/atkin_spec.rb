require 'rspec'
require_relative '../atkin.rb'

describe 'Atkin sieve' do

  it 'should mark non-prime multiples of a prime number, starting with the square of the prime #' do
    input = [true, true, true, false, true, false, true, false, true, false, true]
    expected = [true, true, true, false, false, false, false, false, false, false, false]
    Atkin.sieve(2, input)
    expect(input).to match_array(expected)

    input = [true, true, true, true, true, true, false, true, true, true, true, true, true]
    expected = [true, true, true, true, true, true, false, true, true, false, true, true, false]
    Atkin.sieve(3, input)
    expect(input).to match_array(expected)
  end
end