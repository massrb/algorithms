
require_relative './heap'

=begin

You're given a list of n integers arr[0..(n-1)]. 
You must compute a list output[0..(n-1)] such that, 
for each index i (between 0 and n-1, inclusive), output[i] 
is equal to the median of the elements arr[0..i] 
(rounded down to the nearest integer).
The median of a list of integers is defined as follows. If 
the integers were to be sorted, then:
If there are an odd number of integers, then the median is equal 
to the middle integer in the sorted order.
Otherwise, if there are an even number of integers, then the median 
is equal to the average of the two middle-most integers in the sorted order.

=end

def find_median(arr)
	output = []
	for i in 0...arr.size
		subst = arr[0..i].sort
		puts subst.inspect
		len = subst.length
		output[i] = if (i+1).odd?
			subst[len/2]
		else
			(subst[(len-1)/2] + subst[len/2].to_i) / 2
		end
	end
	output
end



def heap_find_median(arr, verbose=false)
  output = []

  # Max heap for lower half
  low = Heap.new { |a, b| a > b }

  # Min heap for upper half
  high = Heap.new { |a, b| a < b }

  arr.each do |num|
    if low.empty? || num <= low.peek
      low.push(num)
    else
      high.push(num)
    end

    # Balance heaps
    if low.size > high.size + 1
      high.push(low.pop)
    elsif high.size > low.size
      low.push(high.pop)
    end

    # Get median
    if low.size == high.size
      median = (low.peek + high.peek) / 2
    else
      median = low.peek
    end

    output << median
    puts "==============="
    puts "   LOW   \n"
    low.print_tree
    puts "\n\n---------------"
    puts " HIGH  \n"
    high.print_tree
    puts "\n================\n"
  end

  {output: output, low_heap: low, high_heap: high}
end
