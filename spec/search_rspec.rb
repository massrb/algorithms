
require_relative '../search/arrays_median'

RSpec.describe "search tests" do

  it 'finds median of sorted arrays' do
    expect(median_of_arrays([1,3],[2])).to eq(2)
    expect(median_of_arrays([1,3,7,9],[2,3,5])).to eq(3)
    expect(median_of_arrays([2,3,12],[2,4])).to eq(3)
  end

  it 'finds non integer median of sorted arrays' do
    expect(median_of_arrays([4,6,9],[2,7,15])).to eq(6.5)
  end

  it 'finds median of other sorted arrays' do
    expect(median_of_arrays([4,6,9],[2,7,15,19,22])).to eq(8)
  end

end


