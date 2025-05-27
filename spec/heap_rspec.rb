
require_relative '../heaps/large_triple_product'
require_relative '../heaps/find_median'


RSpec.describe "heap test" do
  it 'finds max product' do
    expect(find_max_product( [1, 2, 3, 4, 5])).to eq([-1, -1, 6, 24, 60])
    expect(heap_find_max_product( [1, 2, 3, 4, 5])).to eq([-1, -1, 6, 24, 60])
  end

  it 'finds max product on unsorted array' do	
    expect(find_max_product( [3, 2, 3, 11, 6, 5, 1])).to eq([-1, -1, 18, 99, 198, 330, 330])
    expect(heap_find_max_product([3, 2, 3, 11, 6, 5, 1])).to eq([-1, -1, 18, 99, 198, 330, 330])
  end

  it 'finds median' do
    expect(find_median([5, 15, 1, 3])).to eq([5,10,5,4])
    result = heap_find_median([5, 15, 1, 3])
    expect(result[:output]).to eq([5,10,5,4])
    expect(result[:low_heap].get_data).to eq([3, 1])
  end

  it 'find larger median with heap' do
    result = heap_find_median([5, 15, 1, 3, 7, 8, 9, 12, 22, 32, 1, 44, 55])
    expect(result[:output]).to eq([5, 10, 5, 4, 5, 6, 7, 8, 9, 10, 9, 10, 12])
    expect(result[:low_heap].get_data).to eq([12, 7, 9, 1, 5, 1, 3])
    puts '============='
    puts "   LOW  \n"
    result[:low_heap].print_tree
    puts "\n\n==============="
    puts "    HIGH   \n"
    result[:high_heap].print_tree
  end

  it 'has median with verbosity' do
    result = heap_find_median([5, 15, 1, 3, 7, 8, 9, 12, 22, 32, 1, 44, 55], true)
  end

end