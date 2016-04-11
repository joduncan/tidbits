#!/bin/ruby

actual = ARGF.readline.split.map(&:to_i)
expected = ARGF.readline.split.map(&:to_i)
fines = [ Proc.new { |ad,ed| (ad-ed) * 15 },
          Proc.new { |am,em| (am-em) * 500 },
          Proc.new { |ay,ey| (ay-ey) == 0 ? 0 : 10000 }
        ]

# getting the max fine only works because the ranges for day, month, year fines do not overlap.
fine = fines.zip(actual, expected).map { |func, a, e| func.call(a,e) }.max
puts fine

