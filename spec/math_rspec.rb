
RSpec.describe "math test" do


	it 'does factorial' do	

    # n × (n - 1) × (n - 2) 
		def factorial(n)
		  (1..n).inject(1, :*)
		end

    expect(factorial(3)).to eq(6)
		expect(factorial(5)).to eq(120)

	end

	it 'does fibonacci numbers' do
		# memoized
    def fib_mem(n, memo = {})
      return n if n <= 1
      memo[n] ||= fib_mem(n - 1, memo) + fib_mem(n - 2, memo)
    end

    def fib_iter(n)
  		return n if n <= 1
  		a, b = 0, 1
  		(2..n).each { a, b = b, a + b }
  		b
		end

		def fib(n)
			# (a, b) here is destructures the array passed in
			# _ represents unused index
			result = (0...n).inject([0, 1]) do |(a, b), _|
				[b, a + b]
			end[0]

			if (result != fib_mem(n) || result != fib_iter(n))
			  raise "implementation error"
			end
			result
		end

    expect(fib(3)).to eq(2)
    expect(fib(9)).to eq(34)

	end

  it 'does fibonacci sequence' do
  	def fibonacci_sequence(n)
		  return [] if n < 0      # If n is negative, return an empty array
		  return [0] if n == 0    # The first Fibonacci number is [0]
		  return [0, 1] if n == 1 # The first two Fibonacci numbers are [0, 1]
		  
		  sequence = [0, 1] # Start with the first two Fibonacci numbers
		  
		  # Generate the sequence from 2 to n
		  (2..n).each do
		    sequence << sequence[-1] + sequence[-2] # Add the sum of the last two numbers
		  end
		  
		  sequence
		end

		expect(fibonacci_sequence(10)).to eq([0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55])
	end

	it 'does fibonacci with blocks' do
		def fibonacci
			idx = 0
			seq = [0,1]
			loop do
				yield seq[idx]
				seq << seq[idx] + seq[idx+1]
				idx += 1
			end
		end

  	numbers = []
  	fibonacci do |n|
  		numbers << n
  		break if numbers.size == 11
  	end
  	expect(numbers).to eq([0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55])
  end

  it "find prime numbers" do
  	def first_n_primes(n)
		  primes = []
		  num = 2
		  while primes.length < n
		    primes << num if prime?(num)
		    num += 1
		  end
		  primes
		end

		def prime?(number)
		  return false if number < 2
		  (2..Math.sqrt(number).to_i).none? { |i| number % i == 0 }
		end

		expect(first_n_primes(20)).to eq([2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71])
  end

end
