
RSpec.describe "Array test" do
  
  let(:input) {  [10, 4, 8, 3, 9, 2, 22, 33, 22, 7] }

  it 'has slices' do
  	expect(input.slice(2,3)).to eq([8,3,9])
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

end