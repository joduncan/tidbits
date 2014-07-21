require 'rspec'
require_relative '../number_util.rb'

describe 'multiples_of' do

  it 'should return all multiples of a given number up to (and including) the specified limit' do
    my_multiples = [4,6,8,10]
    expect(Number_util.sieve_multiples_of(2, 10)).to match_array(my_multiples)

    my_multiples = [9,12,15]
    expect(Number_util.sieve_multiples_of(3, 16)).to match_array(my_multiples)
  end
end