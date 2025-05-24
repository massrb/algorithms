
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
    expect(heap_find_median([5, 15, 1, 3])).to eq([5,10,5,4])
  end

end