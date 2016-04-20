#!/bin/ruby

def rotate(array, first_index)
  first, second, third = array[first_index..first_index+2]
#  puts "rotating [#{first},#{second},#{third}] of #{array} at index #{first_index}"
  array[first_index..first_index+2] = second, third, first
end

num_tests = ARGF.readline.to_i
(1..num_tests).each { |test|
  size=ARGF.readline.to_i
  # consider subtracting 1 from each item to make array indexing easier.
  contents = ARGF.readline.split.map(&:to_i)
  # front to back sorting doesn't seem to work for at least 1 example
  # back to front sorting may work, need to iron out how to detect a failure
  # condition.
  (size-1).downto(2) { |final_position|
    #puts "#{final_position+1}/#{final_position}"
    current_index = contents.index(final_position+1)

    # naively choosing triplets: using index-1, index, index+1, rotate twice
    # until item is in correct index.
    # slightly less naively choosing triplets: while index < final_index-2,
    # then choose index, index + 1, index + 2 and rotate triplet once.

    # we don't have to worry about each item being out of position at the end
    # of the list, because no item should be past its correct position once
    # items larger than it have been sorted into their correct positions.

    while (current_index != final_position) do
      if (current_index <= (final_position - 2))
        rotate(contents, current_index)
        current_index += 2
      else
        current_index -= 1
        rotate(contents, current_index)
	# that has the "currently sorting" item in the middle position.
        #if (current_index == final_position - 1)
          #rotation_index = current_index
          #if(final_position > size - 3)
	    # need to adjust the rotation index for items near the end of the
	    # sorted list.
            #rotation_index = size - 3
          #end
          #rotate(contents, rotation_index)
        #end
        #current_index -= 1
      end
    end
  }
  #puts contents.join(' ')
  # array should be "sorted" now. see if indices 0-2 are in the correct order.
  result = "YES"
  result = "NO" if contents[0] != 1
  result = "NO" if contents[1] != 2
  result = "NO" if contents[2] != 3
  puts result
}
