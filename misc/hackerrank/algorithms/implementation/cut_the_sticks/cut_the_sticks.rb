#!/bin/ruby

num_sticks = ARGF.readline.to_i
sticks = ARGF.readline.split.map(&:to_i)

while sticks.length > 0 do
  puts sticks.length
  cut_length = sticks.min
  sticks.map! { |stick| stick - cut_length }.select! { |stick| stick > 0 }
end