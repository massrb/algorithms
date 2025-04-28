
# finds all permutations of string S that exist as substrings 
# within string B. This is commonly known as finding all anagrams of S in B.

def find_permutations_in_string(s, b)
  result = []
  s_length = s.length
  s_count = Hash.new(0)
  window_count = Hash.new(0)

  # Count characters in s
  s.each_char { |char| s_count[char] += 1 }

  b.chars.each_with_index do |char, i|
    # Add current char to the window count
    window_count[char] += 1

    # Remove the char that goes out of the window
    if i >= s_length
      out_char = b[i - s_length]
      window_count[out_char] -= 1
      window_count.delete(out_char) if window_count[out_char] == 0
    end

    # If the window has the same character count as s, it's a valid permutation
    if i >= s_length - 1 && window_count == s_count
      result << b[i - s_length + 1, s_length]
    end
  end

  result
end

# Example usage
s = "abc"
b = "cbabcacab"
puts "Permutations of '#{s}' in '#{b}':"
puts find_permutations_in_string(s, b)

# This uses a sliding window approach.






