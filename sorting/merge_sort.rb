class MergeSort < Algorithm
  # Break's the array down into two numbers (number A and number B) and sorts them.
  def exec(array, depth=0)
    dbg("=======================")
    dbg("depth: #{depth} in merge sort #{array}")
    if array.size <= 1
      return array
    end

    array_size   = array.size
    half_of_size = (array_size / 2).round

    dbg_7("half of size #{half_of_size}")
    left_array  = array.take(half_of_size)
    right_array = array.drop(half_of_size)
    dbg_7("left array #{left_array}")
    dbg_7("right array #{right_array}")

    sorted_left_array = exec(left_array, depth+1)
    sorted_right_array = exec(right_array, depth+1)

    merge(sorted_left_array, sorted_right_array)
  end

  # This then creates a new array, loops through the left/right arrays and places the lowest number into the array. 
  def merge(left_array, right_array)
    if right_array.empty?
      return left_array # We have nothing to compare. Left wins.
    end

    if left_array.empty?
      return right_array # We have nothing to compare. Right wins.
    end

    smallest_number = if left_array.first <= right_array.first
      left_array.shift
    else
      right_array.shift
    end

    # We keep doing it until the left or right array is empty.
    recursive = merge(left_array, right_array)

    # Okay, either left or right array are empty at this point. So we have a result.
    [smallest_number].concat(recursive)
  end
end
