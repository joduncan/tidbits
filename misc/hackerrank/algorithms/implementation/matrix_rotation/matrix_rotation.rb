#!/bin/ruby

def get_bounds(rows, cols, depth)
  min_row = depth
  max_row = rows - depth - 1
  min_col = depth
  max_col = cols - depth - 1
  return min_row, max_row, min_col, max_col
end

def get_line(fixed_coord, min_coord, max_coord, positive_delta, horizontal_orientation)
  incremental_coords = (positive_delta ?
                          min_coord.upto(max_coord-1).to_a :
                          (max_coord).downto(min_coord+1).to_a)

  fixed_coords = [fixed_coord]*incremental_coords.length

  line = (horizontal_orientation ?
           incremental_coords.zip(fixed_coords) :
           fixed_coords.zip(incremental_coords))

  return line
end

def replace_point(matrix, row, col, new_value)
  old_value = matrix[col][row]
  matrix[col][row] = new_value
  return old_value
end

# step 1 in further optimization. flatten each ring into the values.
def get_array(matrix, list)
  return list.map { |y,x| matrix[y][x] }
end

# step 2 in further optimization. swap the two halfs of the ring.
def shuffle_array(array, offset)
  head = array[0..offset-1]
  tail = array[offset..-1]
  return tail + head
end

# step 3 in further optimization(TBD). re-insert the newly rotated values
# back into the original matrix.

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

(0..num_rings-1).each { |ring_num|
  ring = get_ring(matrix, rows, cols, ring_num)

  # no need to spin any ring redundantly.
  real_rotations = rotations % ring.length

  (1..real_rotations).each { |rotation|
    rotate_coord_list(matrix, ring)
  }
}

matrix.each { |row|
  puts row.join(' ')
}
