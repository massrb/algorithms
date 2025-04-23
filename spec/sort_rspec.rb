
require_relative '../algorithm'
require_relative '../sorting/quick_sort'


RSpec.describe "QuickSort test", :type => :request do
  
  describe "sorting and partitioning" do
    let(:input) {  [10, 4, 8, 3, 9, 2, 22, 33, 22, 7] }
    let(:output) { [2, 3, 4, 7, 8, 9, 10, 22, 22, 33] }

    describe "quick sort" do
      let(:sorter) { QuickSort.new(7) }

      it 'can sort' do
        ar = sorter.exec(input,0,9)
        expect(ar).to eq(output)
      end
    end

    describe "partioning" do
      let(:sorter) { QuickSort.new(10) }

      it 'can partition' do
        original = input.dup
        pidx = sorter.partition(input, 0, 9)
        expect(pidx).to eq(3)
        expect(input).to_not eq(original)
        # started as        [10, 4, 8, 3, 9, 2, 22, 33, 22, 7]
        expect(input).to eq [4, 3, 2, 7, 9, 8, 22, 33, 22, 10]
      end
    end
  end

end