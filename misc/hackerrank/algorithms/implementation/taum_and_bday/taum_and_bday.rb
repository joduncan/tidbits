#!/bin/ruby

test_cases = ARGF.readline.to_i

(1..test_cases).each { |case|
  num_black, num_white = ARGF.readline.split.map(&:to_i)
  black_cost, conversion_cost, white_cost = ARGF.readline.split.map(&:to_i)


}
