#!/bin/ruby

begin
  kaprekar = []
  lower = ARGF.readline.to_i
  upper = ARGF.readline.to_i
  (lower..upper).each { |num|
   power = 10 ** num.to_s.length
   sq = (num*num)
   right = sq % power
   left = sq / power
   kaprekar.push(num) if left + right == num
  }
  puts kaprekar.join(' ') unless kaprekar.length == 0
  puts "INVALID RANGE" unless kaprekar.length != 0
end until ARGF.eof?

