# Given an array of integers (which may include repeated integers), determine if
# there's a way to split the array into two subsequences A and B such that the sum 
# of the integers in both arrays is the same, and all of the integers in A are 
# strictly smaller than all of the integers in B.
# Note: Strictly smaller denotes that every integer in A must be less than, and not 
# equal to, every integer in B.

def balanced_split_exists(arr)
	mid = arr.length/2
	sorted = arr.sort!
	left = sorted[0...mid]
	right = sorted[mid...sorted.length]

	keys = []
	loop do
		lsum = left.sum
		rsum = right.sum
		key = "#{left.length}-#{right.length}"
		return true if lsum == rsum && left.max < right.min
		return false if keys.include?(key)
		keys << key
		if lsum < rsum
			left << right.shift
		else
		  right.unshift(left.pop)	
		end
	end
end