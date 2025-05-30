# counts how many unique pairs of elements in 
# an array add up to a given target sum. 

def pair_sums(arr, sum)
	how_many = 0
	for i in 0...arr.length
		for j in i+1...arr.length
			how_many += 1 if arr[i] + arr[j] == sum
		end
	end
	how_many
end