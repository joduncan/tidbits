#!/bin/ruby

test_cases = ARGF.readline.chomp.to_i

def unbribe(list, position)
  temp = list[position+1]
  list[position+1] = list[position]
  list[position] = temp
end

(1..test_cases).each { |test_case|
  size = ARGF.readline.chomp.to_i
  line = ARGF.readline.chomp.split(" ").map(&:to_i)
  too_chaotic = false
  total_bribes = 0
  (line.length-2).downto(0).each { |starting_position|
    current_bribes = 0
    current_position = starting_position
    #while(line[(current_position+1)..-1].any? { |x| x < line[current_position] })
    while(current_position < line.length-1 && line[(current_position+1)] < line[current_position])
      unbribe(line, current_position)
      current_position += 1
      current_bribes += 1
    end
    if current_bribes > 2
      too_chaotic = true
      break
    else
      total_bribes += current_bribes
    end
  }
  if(!too_chaotic)
    puts total_bribes
  else
    puts "Too chaotic"
  end
}
