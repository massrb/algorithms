require_relative '../queues/queue_removal'

RSpec.describe "Queues test" do

  it 'finds removals' do
    expect(find_positions([1, 2, 2, 3, 4, 5], 5)).to eq([5, 6, 4, 1, 2])
  end

end