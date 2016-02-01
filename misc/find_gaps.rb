#!/bin/env ruby

# example usages:
# $0 < list_of_integer_ids.txt
# grep <integer variable type> HeaderFile.h | cut -d= -f2 | sed -e 's/[ ;]//g' | $0

ids = ARGF.readlines.map { |line| line.to_i }.sort

max = ids.last
last = ids.first
ids.each { |id|
  gap = (last..id).to_a
  gap.delete(last)
  gap.delete(id)
  puts "gap: #{gap.length > 1 ? gap : gap.first }" if (gap.length > 0)
  last = id
}
puts "max: #{max}"