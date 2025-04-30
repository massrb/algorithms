def find_signature_counts(arr)
  puts "array: #{arr}"
  n = arr.length
  result = Array.new(n, 0)
  visited = Array.new(n, false)

  (0...n).each do |i|
    puts "\ni:#{i}"
    next if visited[i]

    current = i
    cycle = []

    # Trace the cycle starting from student i
    while !visited[current]
      cycle << current
      visited[current] = true
      current = arr[current] - 1  # convert to 0-based index
    end
   puts "cycle:#{cycle}"
   puts "visited:#{visited}"
   cycle_length = cycle.length
   cycle.each { |index| result[index] = cycle_length }
   puts "result#{result}"
  end
  puts "======================"
  result
end


