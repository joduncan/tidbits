#!/bin/ruby

num_tests = ARGF.readline.to_i

def read_grid
  grid = []
  y, x = ARGF.readline.split.map(&:to_i)
  (0..y-1).each { |row|
    grid.push(ARGF.readline.chomp.split("").map(&:to_i))
  }
  return y, x, grid
end

def search_at(start_x, start_y, grid, sub_x, sub_y, sub)
  found = true
  (start_x..start_x+sub_x-1).each { |x|
    (start_y..start_y+sub_y-1).each { |y|
	  if (grid[y][x] != sub[y-start_y][x-start_x])
	    return false
	  end
	}
  }
  return found
end

(1..num_tests).each { |test|
  found = false
  grid_y, grid_x, grid = read_grid
  search_y, search_x, search = read_grid

  (0..grid_x-search_x).each { |pos_x|
    (0..grid_y-search_y).each { |pos_y|
	  if(!found)
        found = search_at(pos_x, pos_y, grid, search_x, search_y, search)
      end
	  break if found
	}
  }
  if found
    puts "YES"
  else
    puts "NO"
  end
}