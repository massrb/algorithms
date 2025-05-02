# complexity
#
# increasing complexity ascending:
#
# O(1) - constant 
# O(log n) - logarithmic
# O(n) - linear
# O(n log n) - linearithmic
# O(n^2) - quadratic
# O(n^3) - cubic
# O(2^n) - exponential
# O(n!) - factorial
#



def cmp_linear(n)
  # linear O(n)
  (0..n).each { puts n.to_s}
  (0..n).each { |i| puts 'even' if i % 2 == 0}
end

def cmp_quadratic(n)
	# quadratic O(N^2)
  (0..n).each do |i|
    (0..n).each do |j|
      puts "#{i},#{j}"
    end
  end
end

def ordered_pairs(n)
	# O(N^2) - N^2/2 (remove constant)
	# ordered pairs
	(0..n).each do |i|
		(i..n).each do |j|
			puts "#{i},#{j}"
		end
	end
end

def cubic_complexity(n)
	# cubic time complexity, or O(n^3)
	(0..n).each do |i|
		(0..n).each do |j|
			(0..n).each do |k|
				puts "#{i},#{j},#{k}"
			end
		end
	end
end

def bilinear_complexity(a,b)
	# bilinear complexity
	# it is only a quadratic if A and B grow proportionally with each other
	O(A*B)
	(0..a).each do |i|
		(0..b).each do |j|
			puts "#{i},#{j}"
	  end
	end
end

def fib(n)
	# Exponential
	# O(2^k) - k represents the height of the call stack tree
	# calls stack tree doubles in height on every call for recursion
	if (n==0 || n==1)
		return 1
	else
		return fib(n-1) + fib(n - 2)
	end
end

def memoized_fib(n, memo={})
	# when recursion is slow, look into memoization
	# O(k) - k represents the height of the recursion call stack
	# call stack no longer branches out like a tree
	# as in non memoized version
	if (n==0 || n==1)
		return 1
  elsif (memo[n] == 0)
    memo[n] = memoized_fib(n - 1, memo) + memoized_fib(n - 2, memo) 		
	end
	memo[n]
end

def binary_search(arr, target)
	# logarithmic complexity
	# O(log n)
	# Each time through the loop:
  # You cut the search space in half.
  # So the number of steps is proportional to log₂(n).
  # For example, with 1,000,000 elements, you'd need only 
  # about 20 comparisons.
  # 
  # simple example of linearithmic complexity is merge sort

  left = 0
  right = arr.length - 1

  while left <= right
    mid = (left + right) / 2
    return mid if arr[mid] == target

    if arr[mid] < target
      left = mid + 1
    else
      right = mid - 1
    end
  end

  nil  # target not found
end

# Example usage:
sorted_array = [1, 3, 5, 7, 9, 11, 13]
puts binary_search(sorted_array, 9)  # => 4


#=======================

class Person
  attr_accessor :birth, :death

  def initialize(birth, death)
    @birth = birth
    @death = death
  end
end

def highest_population(people)
	# P = number of people
	# L = max possible lifespan for any given person - 100 etc 
	#     depending on the input
	# Y = years covered for analysis, could be 1000 years etc
  # Complexity is O(P*L + Y)

	# 
  # Step 1: Get the latest death year
  # O(P)
  last_death = people.map(&:death).max

  puts "last death#{last_death}"
  # Step 2: Initialize the counter array
  counter = Array.new(last_death + 1, 0)

  # Step 3: Count population per year
  # O(P*L)
  people.each do |person|
    (person.birth...person.death).each do |year|
      counter[year] += 1
    end
  end

  # Step 4: Find the maximum population
  # Loop on Y, counter contains a map of all people
  # in the history of years of all registered lifespans
  # O(Y)
  counter.max
end

# Example usage
people = [
  Person.new(1900, 1950),
  Person.new(1920, 1980),
  Person.new(1930, 1940)
]

puts highest_population(people)

# ==============

def factorial_permutations(arr)
	# O(n!) complexity 
  arr.permutation.to_a
end

p factorial_permutations([1, 2, 3
	# output [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]