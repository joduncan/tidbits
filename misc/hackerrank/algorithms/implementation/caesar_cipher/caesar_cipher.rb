#!/bin/ruby

text_length = ARGF.readline.to_i
plaintext = ARGF.readline.chomp
cipher_offset = ARGF.readline.chomp.to_i

# I have a version of this lying around somewhere that I think is marginally tighter,
# but I can't remember where I put it.
# also, insert "I know, I'll use regexes! ... now I have two problems" joke here.
plaintext.gsub!(/[a-z]/) { |ch| ('a'.ord + ((ch.ord - 'a'.ord + cipher_offset) % 26)).chr }
plaintext.gsub!(/[A-Z]/) { |ch| ('A'.ord + ((ch.ord - 'A'.ord + cipher_offset) % 26)).chr }
puts plaintext

