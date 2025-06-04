
# linearirithimic complexity
# O(n log(n))
class MergeSort < Algorithm
  #
  # O(n log n)
  # Break's the array down into two numbers (number A and number B) and sorts them.
  def exec(array, depth=0)
    if array.size <= 1
      return array
    end
    dbg("=======================")
    dbg("depth: #{depth} in merge sort #{array}")

    half_of_size = (array.size / 2)

    dbg_7("half of size #{half_of_size}")
    left_array  = array.take(half_of_size)
    right_array = array.drop(half_of_size)
    dbg_7("left array #{left_array}")
    dbg_7("right array #{right_array}")

    sorted_left_array = exec(left_array, depth+1)
    sorted_right_array = exec(right_array, depth+1)

    merge(sorted_left_array, sorted_right_array, depth)
  end

  # This then creates a new array, loops through the left/right
  # arrays and places the lowest number into the array.
  #
  # We keep pulling the smaller element off of
  # the arrays and recursivly calling merge()
  # on the rest of the arrays.
  # recursion ends when one of the arrays is empty.
  #
  # because exec() goes down to the lowest parts of the arrays
  # recursively. That means left_array and right_array
  # will always be sorted
  def merge(left_array, right_array, depth)
    # let n = left_array.length + right_array.length
    # Then:
    # There are n recursive calls
    # Each call does constant work: comparison, shifting, and a single concat
    #
    # O(n) complexity
    #
    dbg_7 "....................."
    dbg_7 "merge #{left_array} and #{right_array} (depth:#{depth})"
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
    recursive = merge(left_array, right_array, depth)

    # Okay, either left or right array are empty at this point. So we have a result.
    res = [smallest_number].concat(recursive)
    dbg_7 "merge returns: #{res}"
    res
  end
end
