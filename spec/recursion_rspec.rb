
require_relative '../recursion/encryption'
require_relative '../recursion/change'

RSpec.describe "Recursion test" do
  it 'does encrypt' do
  	expect(encrypt('abcxcba')).to eq('xbacbca')
  end

  it 'makes change' do
  	expect(exact_change?(94, [5,10,25,100,200])).to eq(false)
  	expect(exact_change?(75, [3,17,29])).to eq(true)  		
  end

end