
require_relative '../algorithm'
require_relative '../sorting/quick_sort'
require_relative '../sorting/merge_sort'
require_relative '../sorting/bubble_sort'

RSpec.describe "Sort test" do
  
  let(:input) {  [10, 4, 8, 3, 9, 2, 22, 33, 22, 7] }
  let(:output) { [2, 3, 4, 7, 8, 9, 10, 22, 22, 33] }

  describe "bubble sort" do
    let(:sorter) { BubbleSort.new(7) }

    it 'can sort' do
      ar = sorter.exec(input.shuffle, 0, 9)
      expect(ar).to eq(output)
    end
  end

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
    let(:left_array) { [1, 5, 9, 11] }
    let (:right_array) { [2, 6, 8, 12 ]}

    it 'can sort' do
      result = sorter.exec(input)
      expect(result).to eq(output)
    end

    it 'can merge' do
      result = sorter.merge(left_array, right_array)
      expect(result).to eq([1, 2, 5, 6, 8, 9, 11, 12])
    end

  end

end