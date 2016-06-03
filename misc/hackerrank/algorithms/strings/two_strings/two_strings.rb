#!/bin/ruby

num_tests = ARGF.readline.to_i

(1..num_tests).each { |test_case|
  first_chars = ARGF.readline.chomp.split("").uniq.sort
  second_chars = ARGF.readline.chomp.split("").uniq.sort

  substring_found = false
  first_chars.each { |first_char|
    substring_found = second_chars.any? { |second_char| first_char == second_char }
    break if substring_found
  }
  puts (substring_found ? "YES" : "NO")
}
