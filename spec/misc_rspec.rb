
require_relative '../misc/matching_pairs'
require_relative '../misc/min_length_substr'
require_relative '../misc/pair_sums'
require_relative '../misc/revenue_milestones'
require_relative '../misc/growth_rate'

RSpec.describe "misc" do
  it 'matches pairs' do
    expect(max_matching_pairs_after_swap('abcd','adcb')).to eq(4)
  end

  it 'finds minimum length strings' do
    expect(min_length_substring('dcbefebce', 'fd')).to eq(5)
    expect(min_length_substring('dcbefebce', 'bbfd')).to eq(7)
  end

  it 'pairs sums' do
    expect(pair_sums([1,2,3,4,5], 6)).to eq(2)
    expect(pair_sums([1,5,3,3,3], 6)).to eq(4)
  end

  it 'finds milestones' do
    expect(get_milestone_days(
      [10, 20, 30, 40, 50, 60, 70, 80, 90, 100],
      [100, 200, 500])).to eq([4,6,10])
  end

  it 'does growth rates' do
    expect(get_billion_users([1.5])).to eq(52)
  end

end