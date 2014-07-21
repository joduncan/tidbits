require 'primes'
require 'eratosthenes'

Primes.find(2000000).inject(:+)