#!/bin/ruby

plaintext = ARGF.readline.gsub(/\s/,'')
root = Math.sqrt(plaintext.length)
floor = root.floor
ceil = root.ceil
start=0
chunks = []
while(start < plaintext.length) do
  chunks.push(plaintext[start..start+floor])
  start += ceil
end

cipher = []
floor -= 1 if(floor == ceil)
(0..floor).each { |idx|
  cipher.push("")
  chunks.each { |chunk|
    cipher[idx] += chunk[idx].to_s
  }
}
puts cipher.join(' ')
