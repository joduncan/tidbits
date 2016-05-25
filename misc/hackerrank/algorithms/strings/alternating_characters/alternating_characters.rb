#!/bin/ruby


num_tests = ARGF.readline.to_i

(1..num_tests).each { |test|
  input = ARGF.readline.chomp
  output = input.gsub(/A+/, "A").gsub(/B+/, "B")
  print input.length - output.length, "\n"
}
