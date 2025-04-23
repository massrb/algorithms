
require_relative '../sorting/sorting'
require_relative '../sorting/quick_sort'


RSpec.describe "QuickSort test", :type => :request do
  
  describe "check quick sort" do
    let(:sorter) { QuickSort.new(3) }
    let(:input) {  [1, 4, 8, 4, 9, 3, 22, 33, 22, 11] }
    let(:output) { [1, 3, 4, 4, 8, 9, 11, 22, 22, 33] }
    it 'can sort' do
      ar = sorter.exec(input,0,9)
      expect(ar).to eq(output)
    end

  end


end