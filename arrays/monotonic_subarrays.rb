
=begin

A monotonic subarray is a contiguous portion of an array where the elements are either entirely non-increasing or entirely non-decreasing.

Types of Monotonic Subarrays:
Monotonically Increasing: Each element is greater than or equal to the previous one.
Example: [1, 2, 2, 5]

Monotonically Decreasing: Each element is less than or equal to the previous one.
Example: [9, 7, 5, 5, 3]

=end


def count_subarrays(arr)
  puts "array:#{arr}\n"
  puts "---------"
  n = arr.length
  result = Array.new(n, 1)  # Each element counts itself

  # Count to the left
  stack = []
  (0...n).each do |i|
    puts "============="
    puts "arr[#{i}]: #{arr[i]}"
    # pop elements that can't be part of current max subarray
    while !stack.empty? && arr[stack[-1]] < arr[i]
      puts "pop arr[#{stack[-1]}](#{stack[-1]}) < arr[#{i}](#{arr[i]})"
      stack.pop
    end
    # If stack is empty, current element is greater than all left elements
    if stack.empty?
      result[i] += i
      puts "empty stack - result[#{i}] = #{result[i]}"
    else
    # Otherwise, it can only extend to the element 
    # after the last greater/equal element
    puts "value at end of stack:#{stack[-1]}"
    result[i] += i - stack[-1] - 1
    puts "result[#{i}] = #{result[i]}"
    end
    puts "stack << i(#{i})"
    stack << i
    puts "result: #{result}"
  end

  # puts '-------------'
  # puts "\n"
  # puts 'other way:'

  # Count to the right
  stack = []
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
    # puts "result: #{result}"
  end

  result
end
