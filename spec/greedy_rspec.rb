

require_relative '../greedy/activity_selection'

RSpec.describe 'Greedy test' do

  it 'has activity selection' do
    expect(activity_selection([1, 3, 0, 5, 8, 5],
    	   [2, 4, 6, 7, 9, 9])).to eq([[1, 2], [3, 4], [5, 7], [8, 9]])
  end

end