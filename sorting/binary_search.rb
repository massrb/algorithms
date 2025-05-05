
# O(log n)
def binary_search(array, target)
  low = 0
  high = array.length - 1

  while low <= high
    mid = (low + high) / 2
    guess = array[mid]

    if guess == target
      return mid # Found the target, return its index
    elsif guess < target
      low = mid + 1
    else
      high = mid - 1
    end
  end

  nil # Not found
end

