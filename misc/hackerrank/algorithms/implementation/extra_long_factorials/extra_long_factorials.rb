#!/bin/ruby

num = ARGF.readline.to_i
fact = (num == 0 ? 1 : (1..num).inject(:*))
puts fact
