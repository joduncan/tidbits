#!/bin/ruby

num_tests = ARGF.readline.to_i

(1..num_tests).each { |test_case|
  input = ARGF.readline.chomp
  pal_index = -1
  reversed = input.reverse
  if input != reversed
    (0..input.length-1).each { |index|
      next if input[index] == reversed[index]
      front_stripped = ""
      back_stripped = ""
      if index > 0
        front_stripped = input[0..index-1] + input[index+1..-1]
        back_stripped = reversed[0..index-1] + reversed[index+1..-1]
      else
        front_stripped = input[1..-1]
        back_stripped = reversed[1..-1]
      end
      if front_stripped == front_stripped.reverse
        pal_index = index
	break
      elsif back_stripped == back_stripped.reverse
        pal_index = input.length-1-index
	break
      end
    }
  end 
  print pal_index, "\n"
}
