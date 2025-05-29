
=begin

contiguous sub arrays (not monotonic sub arrays)

You are given an array arr of N integers. For each 
index i, you are required to determine the number of 
contiguous subarrays that fulfill the following conditions:

The value at index i must be the maximum element in the contiguous subarrays, and

These contiguous subarrays must either start from or end on index i.

=end

class ContiguousSubarrays

  def self.count_subarrays(arr)
    up_result = count_up(arr)
    down_result = count_down(arr)
    # each sets result to [1,1,1,1,1]
    # etc to count self so subtract one so as to not
    # count twice
    up_result.zip(down_result).map { |x, y| x + y - 1}
  end

  # as long as the numbers are descending we keep 
  # pushing their indexes onto the stack
  #
  # When a higher number is encountered then 
  # we clear a portion of the stack
  # until the stack reflects an index to a higher number
  # to the left than the current number
  #
  def self.count_up(arr)
    result = Array.new(arr.length, 1)
    stack = []
    (0...arr.length).each do |i|
      puts "============="
      puts "ARRAY:#{arr}"
      puts "arr[#{i}]: #{arr[i]}"
      # pop elements that can't be part of current max subarray
      while !stack.empty? && arr[stack[-1]] < arr[i]
        puts "pop (because arr[#{stack[-1]}](#{arr[stack[-1]]}) < arr[#{i}](#{arr[i]}))"
        stack.pop
      end
      # If stack is empty, current element is 
      # greater than all left elements
      # that means there are i + 1 subarrays to the left
      if stack.empty?
        result[i] += i
        puts "the stack is empty so asign - result[#{i}] = #{result[i]}"
      else
        # in this case
        # the number of subarrays to the left is:
        # (i + 1) - (index of highest element)
        # where the index of the highest element is
        # the most recent higher element to the left
        # (meaniong it is higher than the current element)
        # this index is on the stack
        puts "value at top of stack:#{stack[-1]}"
        result[i] += i - stack[-1] - 1
        puts "result[#{i}] = #{result[i]}"
      end
      puts "stack << i(#{i})"
      stack << i
      puts "stack: #{stack}"
      puts "result: #{result}"
    end
    puts "UP result #{result}"
    result
  end

  def self.count_down(arr)
    res = count_up(arr.reverse)
    res.reverse
  end
  
=begin
  def self.count_down(arr)
    result = Array.new(arr.length, 1)
    stack = []
    n = arr.length
    (n - 1).downto(0) do |i|
      while !stack.empty? && arr[stack[-1]] < arr[i]
        stack.pop
      end
      if stack.empty?
        result[i] += (n - 1) - i
      else
        result[i] += stack[-1] - i - 1
      end
      stack << i
    end
    puts "down result: #{result}"
    result
  end
=end

end
