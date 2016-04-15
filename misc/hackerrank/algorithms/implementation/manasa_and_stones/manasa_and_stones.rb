#!/bin/ruby

num_tests = ARGF.readline.chomp.to_i

(1..num_tests).each { |test|

  # since the first stone has a value of 0, we don't count it in the
  # list of possible permutations.
  num_stones = ARGF.readline.chomp.to_i - 1
  a = ARGF.readline.chomp.to_i
  b = ARGF.readline.chomp.to_i

  # n stones, each increment can be by either a or b.
  # first stone always starts at 0.
  # this is a question of permutations. there are a lot of
  # combinations of a, b within num_stones, but many of those
  # combinations result in the same final result.
  # it seems to me that there are num_stones distinct final results.

  puts (0..num_stones).map { |remainder| a*(num_stones-remainder) + b*remainder }.sort.uniq.join(' ')
}
