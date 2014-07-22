__author__ = 'joduncan'

def find(limit):
    # 0. copy Ruby implementation.
    # 1. create dict with keys up to (and including) the limit.
    possible_primes = { key: True for key in range(limit+1) }
    # 2. filter using sieve.
    possible_primes[0] = False
    possible_primes[1] = False
    for possible_prime in sorted(possible_primes.keys()):
        # == True is technically unnecessary, but sometimes it's helpful to be explicit.
        if possible_primes[possible_prime] == True:
            sieve(possible_prime, limit, possible_primes)
    # 3. return all keys whose values are true.
    # slightly more verbose/explicit, but apparently unnecessary (and less pythonic)
    #return [ key for key in possible_primes.keys() if possible_primes[key] == True ]
    return [ key for key in possible_primes if possible_primes[key] == True ]

def sieve(prime, limit, numbers):
    # no need to go through all numbers up to the limit, the biggest multiple will be around the value of limit/prime
    multiples = [x for x in range(prime, (limit/prime)+1) if x * prime <= limit]
    for x in multiples:
        numbers[prime*x] = False