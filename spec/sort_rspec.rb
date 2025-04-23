
require_relative '../algorithm'
require_relative '../sorting/quick_sort'


RSpec.describe "QuickSort test", :type => :request do
  
  describe "check quick sort" do
    let(:sorter) { QuickSort.new(7) }
    let(:input) {  [10, 4, 8, 3, 9, 2, 22, 33, 22, 7] }
    let(:output) { [2, 3, 4, 7, 8, 9, 10, 22, 22, 33] }
    it 'can sort' do
      ar = sorter.exec(input,0,9)
      expect(ar).to eq(output)
    end

  end


end