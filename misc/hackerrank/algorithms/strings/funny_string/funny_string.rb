#!/bin/ruby

test_cases = ARGF.readline.to_i

(1..test_cases).each { |test|
  input = ARGF.readline.chomp
  reversed = input.reverse
  not_funny = (1..(input.length-1)).any? { |index| 
    (input[index].ord - input[index-1].ord).abs != (reversed[index].ord - reversed[index-1].ord).abs
  }
  print "Not " if not_funny
  print "Funny\n"
}
