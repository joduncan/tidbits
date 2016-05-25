#!/bin/ruby

num_tests = ARGF.readline.to_i

(1..num_tests).each { |test|
  word = ARGF.readline.chomp
  operations = 0
  (0..((word.length-1)/2)).each { |front|
    back = (word.length-1)-front
    operations += (word[front].ord - word[back].ord).abs
  }
  print operations, "\n"
}
