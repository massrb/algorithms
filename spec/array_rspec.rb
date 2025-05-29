 
require_relative '../arrays/signature_cycle'
require_relative '../arrays/contiguous_subarrays'
require_relative '../arrays/spiral_array'

RSpec.describe "Array test" do
  
  let(:input) {  [10, 4, 8, 3, 9, 2, 22, 33, 22, 7] }

  it 'has slices' do
  	expect(input.slice(2,3)).to eq([8,3,9])
    expect([1, 2, 4, 5, 7, 9][2..-1]).to eq([4, 5, 7, 9])
  end

  it 'can insert without flattening' do
  	b = [1, 2, 3]
	  input.insert(3, b)
	  expect(input).to eq([10, 4, 8, [1, 2, 3], 3, 9, 2, 22, 33, 22, 7])
  end

  it 'can insert with flattening' do
  	b = [1, 2, 3]
  	# splat operator (*)
  	# *b means to "expand" the array b into its individual elements.
	  input.insert(3, *b)
	  expect(input).to eq([10, 4, 8, 1, 2, 3, 3, 9, 2, 22, 33, 22, 7])
  end

  it 'can append' do
  	a = [1, 2]
    b = [3, 4]
    # same as 
    # a.concat(b)
	  a += b
	  expect(a).to eq([1,2,3,4])
  end

  it '*splat can be used as method args' do
  	def length_of(*args, n)
  	  args.length
  	end

    expect(length_of(1,2,3,4,5)).to eq(4)
  end

  it 'has a none? method' do
    numbers = [3, 5, 7, 9, 12]

    expect(numbers.none? { |n| n < 0 }).to eq(true)
  end

  it 'can do cycles' do
    expect(find_signature_counts([2, 1])).to eq([2, 2])
    expect(find_signature_counts([1, 2, 3, 4])).to eq([1, 1, 1, 1])
    # 3 cycles for each: (array index starts at 1)
    # 1 passes to 2
    # 2 passes to 3
    # 3 passes to 1
    expect(find_signature_counts([2, 3, 1])).to eq([3, 3, 3])
    expect(find_signature_counts([3, 4, 1, 2])).to eq([2,2,2,2])
  end

  describe 'handles contiguous subarrays' do
    let(:counter) { ContiguousSubarrays }
    it 'counts subarrays' do
      expect(counter.count_subarrays([3, 4, 1, 6, 2])).to eq([1, 3, 1, 5, 1])
      expect(counter.count_subarrays([7, 2, 3, 4, 1, 6, 2])).to eq([7, 1, 2, 4, 1, 6, 1])
      expect(counter.count_up([7, 2, 3, 4, 1, 6, 2])).to eq([1, 1, 2, 3, 1, 5, 1])

      expect(counter.count_subarrays([8, 7, 6, 5, 12, 1])).to eq([4, 3, 2, 1, 6, 1])
      # 
      # 12 and to it's left constitutes significant results
      # when 12 is reached, the stack gets emptied
      # index of 12 is 4 or 5 for 1 based
      expect(counter.count_up([8, 7, 6, 5, 12, 1])).to eq([1, 1, 1, 1, 5, 1])
      expect(counter.count_down([8, 7, 6, 5, 12, 1])).to eq([4, 3, 2, 1, 2, 1])
    end

    it 'has isolated example' do
      # from 3 there is [2, 3] + itself = 2
      # expect(counter.count_up([7, 2, 3, 4, 1, 6, 2])).to eq([1, 1, 2, 3, 1, 5, 1])
      expect(counter.count_up([5, 2, 7, 2, 3, 4, 1, 6, 2])).to eq([1, 1, 3, 1, 2, 3, 1, 5, 1])
    end
  end

  it 'can do spiral arrays' do
    expect(Spiral.gen_spiral(3)).to eq(
         [[1, 2, 3], 
          [8, 9, 4], 
          [7, 6, 5]])
  end

end