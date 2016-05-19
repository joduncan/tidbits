#!/bin/ruby

while !ARGF.eof?
  line = ARGF.readline.chomp.gsub(/\s+/, '')
  letters = {}
  line.downcase.each_char { |letter|
    letters[letter] = 0 if !letters.key?(letter)
    letters[letter]+=1
  }
  print "not " if letters.keys.length != 26
  print "pangram\n"
end
