
# You are given two strings s and t. 
# You can select any substring of string 
# s and rearrange the characters of the 
# selected substring. Determine the minimum 
# length of the substring of s such that string t 
# is a substring of the selected substring.

def min_length_substring(s,t)
  min = -1
  for i in 0...s.length do
  	for j in (s.length - 1).downto(i) do
  		substr = s[i..j]
  		found = t.chars.uniq.all? { |c| substr.count(c) == t.count(c) } ##
  		if found
  			min = substr.length if min < 0
        min = [min, substr.length].min
  		end
		end  		
  end
  min
end