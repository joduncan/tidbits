#!/bin/ruby

ARGF.each { |line|

  key_chars = line.chomp.split("")

  charmap = {}
  key_chars.each { |char|
    charmap[char] = 0 unless charmap.key?(char)
    charmap[char] += 1
  }
  if charmap.keys.select { |char| charmap[char] % 2 == 1 }.length > 1
    puts "NO"
  else
    puts "YES"
  end
}
