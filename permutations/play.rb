
def find_permutations_in_string(s, b)
  start = 0
  len = s.length
  sorted = s.chars.sort
  while (start + len < b.length)
    substr = b.chars.slice(start, len)
    puts substr.inspect if sorted == substr.sort
    start += 1
  end
end

s = "abc"
b = "cbabcacab"
puts "Permutations of '#{s}' in '#{b}':"
puts find_permutations_in_string(s, b)