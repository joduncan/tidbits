#!/bin/ruby

def get_bounds(rows, cols, depth)
  min_row = depth
  max_row = rows - depth - 1
  min_col = depth
  max_col = cols - depth - 1
  return min_row, max_row, min_col, max_col
end

def get_line(fixed_coord, min_coord, max_coord, positive_delta, horizontal_orientation)
# version 3

  incremental_coords = (positive_delta ?
                          min_coord.upto(max_coord-1).to_a :
                          (max_coord).downto(min_coord+1).to_a)

  fixed_coords = [fixed_coord]*incremental_coords.length
  line = (horizontal_orientation ?
           incremental_coords.zip(fixed_coords) :
           fixed_coords.zip(incremental_coords))
  #print "line: ", line, "\n"
  return line
end
# version 1 of get_line
  #if(horizontal_orientation)
    #(min_coord..max_coord-1).each { |coord|
      #line.push([fixed_coord, coord])
    #}
  #else
    #(min_coord..max_coord-1).each { |coord|
      #line.push([coord, fixed_coord])
    #}
  #end

# version 2 of get_line
#  (min_coord..max_coord-1).each { |coord|
#    if(horizontal_orientation)
#      line.push([fixed_coord, coord])
#    else
#      line.push([coord, fixed_coord])
#    end
#  }

def replace_point(matrix, row, col, new_value)
  old_value = matrix[col][row]
  matrix[col][row] = new_value
  return old_value
end

def get_ring(matrix, rows, cols, depth)
  min_row, max_row, min_col, max_col = get_bounds(rows, cols, depth)

  ring_points = []
  line = get_line(min_col, min_row, max_row, true, false)
  ring_points += line
  line = get_line(max_row, min_col, max_col, true, true)
  ring_points += line
  line = get_line(max_col, min_row, max_row, false, false)
  ring_points += line
  line = get_line(min_row, min_col, max_col, false, true)
  ring_points += line
  return ring_points
end
# get_ring v0
#  ring_points = Set.new
#  [min_row,max_row].each { |tmp_x|
#    (min_col..max_col).each { |tmp_y|
#      ring_points.add([tmp_x,tmp_y])
#    }
#  }

#  [min_col, max_col].each { |tmp_y|
#    (min_row..max_row).each { |tmp_x|
#      ring_points.add([tmp_x,tmp_y])
#    }
#  }

def get_movement_deltas(row, col, min_row, max_row, min_col, max_col)
  x_delta = 0
  y_delta = 0

  y_delta = 1 if ((col != max_col) && (row == min_row))
  y_delta = -1 if ((col != min_col) && (row == max_row))
  x_delta = 1 if ((col == max_col) && (row != max_row))
  x_delta = -1 if ((col == min_col) && (row != min_row))
  return x_delta, y_delta
end

def rotate_ring(matrix, rows, cols, depth)
  ring = get_ring(matrix, rows, cols, depth)
  primer_x, primer_y = ring[-1]
  primer = matrix[primer_y][primer_x]
  ring.each { |y,x| primer = replace_point(matrix, y, x, primer) }
end

def rotate_coord_list(matrix, list)
  primer_x, primer_y = list[-1]
  primer = matrix[primer_y][primer_x]
  list.each { |y,x| primer = replace_point(matrix, y, x, primer) }
end

rows, cols, rotations = ARGF.readline.split.map(&:to_i)

matrix = []
(1..rows).each { |row|
  matrix.push(ARGF.readline.split.map(&:to_i))
}

num_rings = [rows, cols].min / 2
#puts "num rings: #{num_rings}"
#rotate_ring(matrix, rows, cols, 1)
#outer_ring = get_ring(matrix, rows, cols, 0)
#inner_ring = get_ring(matrix, rows, cols, 1)

#puts "outer ring:"
#outer_ring.each { |x,y| puts "#{x}/#{y}: would delete #{matrix[y][x]}" } #;matrix[y].delete_at(x) }
#puts "inner ring:"
#inner_ring.each { |x,y| puts "#{x}/#{y}: would delete #{matrix[y][x]}" } #;matrix[y].delete_at(x) }


#matrix.each { |row| puts row.join(' ') }

(0..num_rings-1).each { |ring_num|
  ring = get_ring(matrix, rows, cols, ring_num)
  #print "ring: ", ring, "\n"
  real_rotations = rotations % ring.length
  (1..rotations).each { |rotation|
    rotate_coord_list(matrix, ring)
    #puts "#{rotation} of ring: #{ring.map { |x,y| matrix[y][x] }}"
  }
}

#rotate_ring(matrix, rows, cols, 0)
#rotate_ring(matrix, rows, cols, 0)
#rotate_ring(matrix, rows, cols, 1)
#rotate_ring(matrix, rows, cols, 1)
matrix.each { |row|
  puts row.join(' ')
}

