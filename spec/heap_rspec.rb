
require_relative '../heaps/large_triple_product'

RSpec.describe "heap test" do
  it 'finds max product' do	
    expect(find_max_product( [1, 2, 3, 4, 5])).to eq([-1, -1, 6, 24, 60])
    expect(heap_find_max_product( [1, 2, 3, 4, 5])).to eq([-1, -1, 6, 24, 60])
  end

  it 'finds max product on unsorted array' do	
    expect(find_max_product( [3, 2, 3, 11, 6, 5, 1])).to eq([-1, -1, 18, 99, 198, 330, 330])
    expect(heap_find_max_product([3, 2, 3, 11, 6, 5, 1])).to eq([-1, -1, 18, 99, 198, 330, 330])
  end


end