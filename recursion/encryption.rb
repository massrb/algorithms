
=begin
You've devised a simple encryption method for alphabetic 
strings that shuffles the characters in such a way that the 
resulting string is hard to quickly read, but is easy to convert 
back into the original string.
When you encrypt a string S, you start with an initially-empty resulting 
string R and append characters to it as follows:

Append the middle character of S (if S has even length, 
then we define the middle character as the left-most of the two central characters)

Append the encrypted version of the substring of S that's to 
the left of the middle character (if non-empty)

Append the encrypted version of the substring of S that's to 
the right of the middle character (if non-empty)

For example, to encrypt the string "abc", we first take "b", and
then append the encrypted version of "a" (which is just "a") and the
encrypted version of "c" (which is just "c") to get "bac".
If we encrypt "abcxcba" we'll get "xbacbca". That is, we take "x" 
and then append the encrypted version "abc" and then append the encrypted version of "cba".
=end

def encrypt(str)
	return str if str.length <= 1
	mid = str.length / 2
	if str.length % 2 == 0
		mid -= 1
	end
  left = str[0...mid]
  right = str[mid+1...str.length]
  return str[mid] + encrypt(left) + encrypt(right)
end
