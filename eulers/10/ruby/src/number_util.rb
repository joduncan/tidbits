class Number_util
  # this could probably also be a lambda. don't know if that would make any difference
  # to the ruby underworkings.
  # FIXME: this should be moved to atkin.rb, or atkin.rb(since 'factor_of = prime' is the Atkin optimization)
  def self.sieve_multiples_of prime, limit
    # easy to read, but is this inefficient??
    #(prime+1..limit).select { |number|
    #  number % prime == 0
    #}
    factor_of = prime
    multiples = []
    until (factor_of * prime) > limit
      multiples.push(factor_of*prime)
      factor_of += 1
    end
    multiples
  end
end