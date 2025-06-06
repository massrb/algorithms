=begin

this algorithm simulates priority-based queue processing with constraints, 
which is a very common pattern in real-world systems.

Round Robin CPU scheduling: Some processes may have higher priority (value), 
and only a certain number of processes are examined at a time.

This algorithm mimics:

Pulling a batch of tasks,
Selecting the most critical one to run (and removing it),
Slightly aging others (by decrementing),
Putting them back in the queue.

-----------------

You're given a list of n integers arr, which 
represent elements in a queue (in order from front to back). 
You're also given an integer x, and must perform x iterations 
of the following 3-step process:

Pop x elements from the front of queue (or, if it contains fewer 
than x elements, pop all of them)

Of the elements that were popped, find the one with the largest 
value (if there are multiple such elements, take the one which had 
been popped the earliest), and remove it

For each one of the remaining elements that were popped 
(in the order they had been popped), decrement its value by 
1 if it's positive (otherwise, if its value is 0, then it's 
left unchanged), and then add it back to the queue

Compute a list of x integers output, the ith of which is the 
1-based index in the original array of the element which had 
been removed in step 2 during the ith iteration.

=end
def find_positions(arr, x)
  queue = arr.each_with_index.map { |val, i| [val, i + 1] }  # [value, original_index]
  
  result = []

  x.times do
    popped = []
    puts "Queue: #{queue}"
    # Step 1: Pop up to x elements
    x.times do
      break if queue.empty?
      popped << queue.shift
    end
    puts "popped: #{popped}"
    # Find max (by value, then by order).
    # earlier elements rank higher when values are tied by using
    # -popped.index
    max_elem = popped.max_by { |val, idx| [val, -popped.index([val, idx])] } ##
    puts "max_elem:#{max_elem}"
    result << max_elem[1]  # store original index
    puts 'result:' + result.inspect

    # Decrement and re-queue remaining elements
    # max_elem is removed
    popped.each do |val, idx|
      next if [val, idx] == max_elem
      val = [val - 1, 0].max
      queue << [val, idx]
    end
  end

  result
end
