class Number_util
  # this could probably also be a lambda. don't know if that would make any difference
  # to the ruby underworkings.
  def self.multiples_of prime, limit
    # elegant, but is this inefficient??
    #(prime+1..limit).select { |number|
    #  number % prime == 0
    #}
    factor_of = 2
    multiples = []
    until (factor_of * prime) > limit
      multiples.push(factor_of*prime)
      factor_of += 1
    end
    multiples
  end
end