#!/bin/ruby

num_tests = ARGF.readline.to_i

1.upto(num_tests).each { |test_case|
  input = ARGF.readline.chomp.split("")
  length = input.length
  output = -1
  if length %2 == 0
    first_set = input[0..length/2-1]
    second_set = input[length/2..-1]
    first_set.each { |item|
      # yes, this line is somewhat stolen/modified from stackoverflow
      second_set.delete_at(second_set.index(item)) if second_set.include?(item)
    }
    output = second_set.length
  end
  print output, "\n"
}
