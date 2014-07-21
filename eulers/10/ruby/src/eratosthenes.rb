require './number_util'

class Eratosthenes
  def self.sieve prime=2, prime_flags = {}
    # this is not an off-by-one error, the array has an "unused" zero element
    # to simplify code readability.
    limit = prime_flags.keys.size-1
    # this may be inefficient. could do a do...until loop instead for multiples.
    multiples = Number_util.multiples_of prime, limit
    multiples.each { |multiple| prime_flags[multiple] = false }
  end
end