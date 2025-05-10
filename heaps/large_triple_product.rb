
=begin

You're given a list of n integers arr[0..(n-1)]. 
You must compute a list output[0..(n-1)] such that, 
for each index i (between 0 and n-1, inclusive), output[i] 
is equal to the product of the three largest elements out of arr[0..i] 
(or equal to -1 if i < 2, as arr[0..i] then includes fewer than three elements).
Note that the three largest elements used to form any product may have 
the same values as one another, but they must be at different indices in arr.


=end


def find_max_product(arr)
  result = []
  max1 = max2 = max3 = -Float::INFINITY

  arr.each_with_index do |num, i|
    # Update the top 3 max values manually
    if num >= max1
      max3 = max2
      max2 = max1
      max1 = num
    elsif num >= max2
      max3 = max2
      max2 = num
    elsif num >= max3
      max3 = num
    end

    if i < 2
      result << -1
    else
    	puts "#{max1}x#{max2}x#{max3}=#{max1*max2*max3}"
      result << (max1 * max2 * max3)
    end
  end

  result
end

class MaxHeap
  def initialize
    @heap = []
  end

  def insert(val)
    @heap << val
    heapify_up(@heap.size - 1)
  end

  def extract_max
    return nil if @heap.empty?
    max = @heap[0]
    @heap[0] = @heap.pop
    heapify_down(0)
    max
  end

  def size
    @heap.size
  end

  private
	# This function ensures the heap property is maintained after inserting a new element.
	# It "bubbles up" the newly added element at index `i` to its correct position in the heap.
	def heapify_up(i)
	  # Keep moving up the heap until you reach the root (index 0) or find a parent greater than the current element
	  while i > 0
	    # Find the index of the parent node. For any node at index `i`, its parent is at index `(i - 1) / 2`.
	    parent = (i - 1) / 2
	    
	    # If the current element is greater than its parent, swap them.
	    # This ensures that the max-heap property is maintained (parent >= child).
	    if @heap[i] > @heap[parent]
	      # Swap the current node with its parent
	      @heap[i], @heap[parent] = @heap[parent], @heap[i]
	      
	      # After the swap, we need to check the new parent of the current node (which is now the previous parent)
	      i = parent
	    else
	      # If the parent is greater than or equal to the current node, no further action is needed.
	      # The heap property is already satisfied.
	      break
	    end
	  end
	end

  # This function ensures the heap property is maintained after removing the root element (or after an element is swapped).
	# It "bubbles down" the element at index `i` to its correct position in the heap.
	def heapify_down(i)
	  # Get the size of the heap, which is used to check for valid left and right children
	  size = @heap.size
	  
	  # Start a loop that will continue until the heap property is restored (no swaps are needed)
	  loop do
	    # Find the indices of the left and right children of the current node
	    left = 2 * i + 1  # Left child index: 2i + 1
	    right = 2 * i + 2 # Right child index: 2i + 2
	    largest = i       # Assume the current node is the largest initially

	    # Check if the left child exists and is greater than the current node (largest so far)
	    # If true, set largest to the left child index
	    largest = left if left < size && @heap[left] > @heap[largest]

	    # Check if the right child exists and is greater than the current largest node
	    # If true, set largest to the right child index
	    largest = right if right < size && @heap[right] > @heap[largest]

	    # If the largest element is not the current node, we need to swap
	    if largest != i
	      # Swap the current node with the largest of the left or right children
	      @heap[i], @heap[largest] = @heap[largest], @heap[i]
	      
	      # After the swap, we continue to "bubble down" the element to its new position (largest)
	      i = largest
	    else
	      # If no swap is needed (the current node is larger than both children), break the loop
	      break
	    end
	  end
	end
end


def heap_find_max_product(arr)
  result = []
  heap = MaxHeap.new

  arr.each_with_index do |num, i|
    heap.insert(num)

    if i < 2
      result << -1
    else
      # Extract top 3 max values
      first = heap.extract_max
      second = heap.extract_max
      third = heap.extract_max

      product = first * second * third
      result << product

      # Push them back
      heap.insert(first)
      heap.insert(second)
      heap.insert(third)
    end
  end

  result
end