#!/bin/ruby

test_cases = ARGF.readline.to_i

(1..test_cases).each { |tc|
  num_black, num_white = ARGF.readline.split.map(&:to_i)
  black_price, white_price, conversion_price = ARGF.readline.split.map(&:to_i)

  black_cost = black_price
  black_cost = (white_price + conversion_price) if(white_price + conversion_price < black_price)
  white_cost = white_price
  white_cost = (black_price + conversion_price) if(black_price + conversion_price < white_price)
  puts num_black * black_cost + num_white * white_cost
}
