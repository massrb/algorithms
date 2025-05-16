

require_relative '../easier_problems/leaderboard'

RSpec.describe "easier problems" do

  it 'does leadership rankng' do

    expect(climb_leader_board([100,100, 50, 40, 40, 20, 10], 
    	                      [5, 25, 50, 120])).to eq([6,4,2,1])
  end
end
