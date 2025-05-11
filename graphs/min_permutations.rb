=begin
In this problem, you are given an integer N, and a permutation, 
P of the integers from 1 to N, denoted as (a_1, a_2, ..., a_N). 
You want to rearrange the elements of the permutation into increasing order, r
epeatedly making the following operation:

Select a sub-portion of the permutation, (a_i, ..., a_j), and r
everse its order.

Your goal is to compute the minimum number of such operations required 
to return the permutation to increasing order.

Signature
int minOperations(int[] arr)

Input
Array arr is a permutation of all integers from 1 to N, N is between 1 and 8

Output
An integer denoting the minimum number of operations required to arrange the permutation in increasing order
=end

# Define the method to calculate the minimum number of operations
def min_operations(arr)
  # Target sorted array (1 to N)
  target = arr.sort

  # If the input is already sorted, no operations are needed
  return 0 if arr == target

  # BFS initialization: start with the initial permutation
  queue = [{ arr: arr, ops: 0 }] # Each element is a hash with 'arr' as the permutation and 'ops' as the number of operations
  seen = Set.new([arr])          # Use a set to track visited permutations to avoid cycles

  # BFS loop
  while !queue.empty?
    current = queue.shift           # Dequeue the front element
    current_arr = current[:arr]     # Current permutation
    current_ops = current[:ops]     # Number of operations taken so far

    # Try all possible subarray reversals
    (0...current_arr.length).each do |i|
      (i + 1...current_arr.length).each do |j|
        # Reverse the subarray from index i to j (inclusive)
        new_arr = current_arr[0...i] + current_arr[i..j].reverse + current_arr[j + 1..-1]

        # If we reach the target sorted array, return the number of operations
        if new_arr == target
          return current_ops + 1
        end

        # If the new permutation has not been visited, enqueue it
        if !seen.include?(new_arr)
          seen.add(new_arr)
          queue.push({ arr: new_arr, ops: current_ops + 1 })
        end
      end
    end
  end

  # This should never be reached since the problem guarantees a solution
  return -1
end
