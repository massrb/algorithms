
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