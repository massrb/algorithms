
require_relative '../misc/matching_pairs'
require_relative '../misc/min_length_substr'


RSpec.describe "misc" do
  it 'matches pairs' do
    expect(max_matching_pairs_after_swap('abcd','adcb')).to eq(4)
  end

  it 'finds minimum length strings' do
    expect(min_length_substring('dcbefebce', 'fd')).to eq(5)
    expect(min_length_substring('dcbefebce', 'bbfd')).to eq(7)
  end

end