#!/bin/ruby

map_size = ARGF.readline.to_i

def read_map(size)
  map = []
  (0..size-1).each { |row|
    map.push(ARGF.readline.chomp.split("").map(&:to_i))
  }
  return map
end

def is_cavity(x, y, map)
  is_cavity = false
  # no edge can ever be a cavity.
  if (x != 0 && x != map.length-1 &&
	  y != 0 && y != map.length-1 &&
	  # compare against neighbors
      map[y][x-1] < map[y][x] &&
      map[y][x+1] < map[y][x] &&
	  map[y-1][x] < map[y][x] &&
	  map[y+1][x] < map[y][x])
    is_cavity = true
  end
  return is_cavity
end

input_map = read_map(map_size)
output_map = Array.new(map_size) { Array.new(map_size) }

(0..map_size-1).each { |x|
  (0..map_size-1).each { |y|
    if(is_cavity(x,y, input_map))
	  output_map[y][x] = 'X'
	else
	  output_map[y][x] = input_map[y][x]
	end
  }
}

output_map.each { |line| puts line.join }
