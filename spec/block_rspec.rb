

RSpec.describe "Block test" do

  it 'has procs' do
    square = Proc.new { |x| x * x }
    result = [1, 2, 3, 4].map(&square)
    expect(result).to eq([1,4,9,16])
  end

  it 'has procs with wrong number of parameters' do
    my_proc = Proc.new { |x, y| "x: #{x}, y: #{y}" }
    expect(my_proc.call(10)).to eq("x: 10, y: ")
  end

  it 'has lambda strictness' do
  	my_lambda = lambda { |a, b| puts "a=#{a}, b=#{b}" }
  	expect { my_lambda.call(1) }.to raise_error(ArgumentError)
  end

end