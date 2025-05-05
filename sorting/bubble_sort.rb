
class BubbleSort < Algorithm

  def traverse(array, first ,last)
  	current = first
		swapped = false
		dbg_7("current: #{current}, last: #{last}")
		while (current + 1) <= last
			if array[current] > array[current+1]
				swapped = true
				array[current], array[current+1] = array[current+1], array[current]
				dbg_5("array: #{array}")
			end
			current += 1
		end
		dbg_5("return swapped=#{swapped}")
		swapped
  end

	def exec(array, first, last)
		# O(n^2) — quadratic time complexity
		# formula for the sum of the first n natural numbers is
		# (n-1).downto(1).inject(0) { |sum, i| sum + i } == n*(n - 1)/2
		# or (n-1) + (n-2) + .. + 1 == n*(n-1)/2
    # for every element, it performs comparisons with 
    # almost every other element in the list, thus n^2

    # bubble sort is an in place sort and uses O(1) space complexity
    # It may work for small arrays or those that are almost sorted.
    # It is a simple sort and has educational aspects to it

		if first < last
			done = false
			while !done
				swapped = traverse(array, first, last)
				last -= 1
				done = !swapped
			end
		end
		return array
  end

end