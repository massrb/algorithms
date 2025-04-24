
require_relative '../algorithm'
require_relative '../sorting/quick_sort'
require_relative '../sorting/merge_sort'

RSpec.describe "Sort test", :type => :request do
  
  let(:input) {  [10, 4, 8, 3, 9, 2, 22, 33, 22, 7] }
  let(:output) { [2, 3, 4, 7, 8, 9, 10, 22, 22, 33] }

  describe "quick sorting and partitioning" do
  
    describe "quick sort" do
      let(:sorter) { QuickSort.new(7) }

      it 'can sort' do
        ar = sorter.exec(input.shuffle,0,9)
        expect(ar).to eq(output)
      end
    end

    describe "quick sort partioning" do
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

  describe "merge sorting" do
    let(:sorter) { MergeSort.new(7) }

    it 'can sort' do
      result = sorter.exec(input)
      expect(result).to eq(output)
    end
  end

end