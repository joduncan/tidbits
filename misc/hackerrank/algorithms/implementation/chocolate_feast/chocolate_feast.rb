#!/bin/ruby

num_tests = ARGF.readline.to_i

(1..num_tests).each { |test| 
  bank, item_cost, trade_in_value = ARGF.readline.split.map(&:to_i)
  candy = bank / item_cost
  wrappers = candy
  while wrappers >= trade_in_value
    candy += wrappers / trade_in_value
	new_wrappers = wrappers / trade_in_value
	wrappers = wrappers % trade_in_value + new_wrappers
  end
  puts candy
}