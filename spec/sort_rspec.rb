
require_relative '../algorithm'
require_relative '../sorting/quick_sort'
require_relative '../sorting/merge_sort'
require_relative '../sorting/bubble_sort'
require_relative '../sorting/avl_binary_search_tree'
require_relative '../sorting/binary_search'


RSpec.describe "Sort test" do
  
  let(:unsorted_array) {  [10, 4, 8, 3, 9, 2, 22, 33, 22, 7] }
  let(:sorted_array) { [2, 3, 4, 7, 8, 9, 10, 22, 22, 33] }

  describe "bubble sort" do
    let(:sorter) { BubbleSort.new(7) }

    it 'can sort' do
      ar = sorter.exec(unsorted_array.shuffle, 0, 9)
      expect(ar).to eq(sorted_array)
    end
  end

  describe "quick sorting and partitioning" do
  
    describe "quick sort" do
      let(:sorter) { QuickSort.new(7) }

      it 'can sort' do
        ar = sorter.exec(unsorted_array.shuffle,0,9)
        expect(ar).to eq(sorted_array)
      end
    end

    describe "quick sort partioning" do
      let(:sorter) { QuickSort.new(10) }

      it 'can partition' do
        original = unsorted_array.dup
        pidx = sorter.partition(unsorted_array, 0, 9)
        expect(pidx).to eq(3)
        expect(unsorted_array).to_not eq(original)
        # started as        [10, 4, 8, 3, 9, 2, 22, 33, 22, 7]
        expect(unsorted_array).to eq [4, 3, 2, 7, 9, 8, 22, 33, 22, 10]
      end
    end
  end

  describe "merge sorting" do
    let(:sorter) { MergeSort.new(7) }
    let(:left_array) { [1, 5, 9, 11] }
    let (:right_array) { [2, 6, 8, 12 ]}

    it 'can sort' do
      result = sorter.exec(unsorted_array)
      expect(result).to eq(sorted_array)
    end

    it 'can merge' do
      result = sorter.merge(left_array, right_array)
      expect(result).to eq([1, 2, 5, 6, 8, 9, 11, 12])
    end
  end

  it 'can do a binary search' do
    expect(binary_search(sorted_array, 8)).to eq(4)
  end

  it 'can build an AVL binary search tree' do
    expect(avl_tree_sort(unsorted_array)).to eq(sorted_array)
  end

end