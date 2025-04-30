def count_subarrays(arr)
  n = arr.length
  result = Array.new(n, 1)  # Each element counts itself

  # Count to the left
  stack = []
  (0...n).each do |i|
    while !stack.empty? && arr[stack[-1]] < arr[i]
      stack.pop
    end
    if stack.empty?
      result[i] += i
    else
      result[i] += i - stack[-1] - 1
    end
    stack << i
  end

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
  end

  result
end
