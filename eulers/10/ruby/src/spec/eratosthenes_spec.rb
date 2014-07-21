require 'rspec'
require_relative '../eratosthenes.rb'

describe 'Eratosthenes sieve' do

  it 'should mark non-prime multiples of a prime number' do
    input = [true, true, true, false, true, false, true, false, true, false, true]
    expected = [true, true, true, false, false, false, false, false, false, false, false]
    Eratosthenes.sieve(2, input)
    expect(input).to match_array(expected)
  end
end