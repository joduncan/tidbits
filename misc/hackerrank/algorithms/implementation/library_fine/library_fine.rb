#!/bin/ruby

actual = ARGF.readline.split.map(&:to_i)
expected = ARGF.readline.split.map(&:to_i)
fines = [ Proc.new { |ad,ed| (ad-ed) * 15 },
          Proc.new { |am,em| (am-em) * 500 },
          Proc.new { |ay,ey| (ay-ey) <= 0 ? 0 : 10000 }
        ]

actual_joined = actual.reverse.map { |x| (x < 10) ? "%02d" % x : x.to_s }.join.to_i
expected_joined = expected.reverse.map { |x| (x < 10) ? "%02d" % x : x.to_s }.join.to_i
fine = 0
if(actual_joined > expected_joined)
  # nice idea, but it didn't initially handle situations where the actual return is
  # before the expected, in a different calendar year.
  fine = fines.zip(actual, expected).map { |func, a, e| func.call(a,e) }.max
end
puts fine

