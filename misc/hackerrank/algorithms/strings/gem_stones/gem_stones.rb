#!/bin/ruby

num_stones = ARGF.readline.to_i
stones = []
(1..num_stones).each { |stone|
  stones.push(ARGF.readline.chomp)
}
gems = ('a'..'z').select { |letter| stones.all? { |stone| stone.include?(letter) } }
print gems.length, "\n"
