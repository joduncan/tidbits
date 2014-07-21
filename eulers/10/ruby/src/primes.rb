require './eratosthenes'

class Primes
  def self.find limit=20000
    possible_primes = Hash[ (0..limit).map { |number| [number, true] } ]
    # don't bother finding out if zero is a prime. it's included in the array just to simplify the code.
    possible_primes[0] = false
    possible_primes[1] = false
    possible_primes.each_key do |number|
      # 1 will throw off my sieve algo by marking all other #'s as non-prime
      if((possible_primes[number] == true) && (prime?(number)))
        # this is not, strictly speaking, functional behavior. I'm not sure how to combine my
        # each_index behavior above with returning an array below. perhaps create an array of indices
        # and then re-assign possible_primes each time this is run. TODO: postponed for v3.
        Eratosthenes.sieve(number, possible_primes)
      end
    end
    possible_primes.select { |number, is_prime| number if is_prime }.keys
  end

  # TODO: v2: feed in the Eratosthenes-sieve-found sub-list of #'s less than this #,
  # so that the prime search is faster.
  def self.prime? possible_prime=1
    prime = true
    # 1 would make every number appear to be non-prime.
    (2..possible_prime-1).each do |factor|
      if (possible_prime % factor == 0)
        prime = false
        break
      end
    end
    prime
  end
end