require './atkin'

class Primes
  def self.find limit=20000
    possible_primes = Hash[ (0..limit).map { |number| [number, true] } ]
    # don't bother finding out if zero is a prime. it's included in the array just to simplify the code.
    possible_primes[0] = false
    possible_primes[1] = false
    possible_primes.each_key do |number|
      # 1 will throw off my sieve algo by marking all other #'s as non-prime
      # this is not, strictly speaking, functional behavior. I'm not sure how to combine my
      # each_index behavior above with returning an array below. perhaps create an array of indices
      # and then re-assign possible_primes each time this is run. TODO: postponed for v2.
      Atkin.sieve(number, possible_primes) if(possible_primes[number] == true)
    end
    possible_primes.select { |number, is_prime| number if is_prime }.keys
  end
end