
# Given two strings s and t of length N, find the maximum number 
# of possible matching pairs in strings s and t after swapping 
# exactly two characters within s.
# A swap is switching s[i] and s[j], where s[i] and s[j] denotes 
# the character that is present at the ith and jth index of s, 
# respectively. The matching pairs of the two strings are defined 
# as the number of indices for which s[i] and t[i] are equal.

def max_matching_pairs_after_swap(s, t)
  return 0 if s.length != t.length

  n = s.length
  max_matches = 0

  # Count initial matches
  initial_matches = (0...n).count { |i| s[i] == t[i] }

  max_matches = initial_matches
  puts "initial:#{initial_matches}"

  # Try all pairs of indices (i, j) to swap in s
  (0...n).each do |i|
    (i + 1...n).each do |j|
      s_swapped = s.dup
      # Swap s[i] and s[j]
      s_swapped[i], s_swapped[j] = s_swapped[j], s_swapped[i]

      # Count matches after the swap
      matches = (0...n).count { |k| s_swapped[k] == t[k] }

      max_matches = [max_matches, matches].max
    end
  end

  max_matches
end