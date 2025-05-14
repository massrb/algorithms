require_relative '../misc/string_op'
require_relative '../strings/strings'

RSpec.describe "string test" do

	it 'does cyphers' do
		res = StringOp.rotational_cipher('Zebra-493?', 3)
		expect(res).to eq('Cheud-726?')
	end

	it 'handles one edit away' do
		expect(one_edit_apart('cats', 'bats')).to eq(true)
		expect(one_edit_apart('cats', 'bat')).to eq(false)
		expect(one_edit_apart('cats', 'dogs')).to eq(false)
		expect(one_edit_apart('cats', 'ats')).to eq(true)
		expect(one_edit_apart('cats', 'cat')).to eq(true)
		expect(one_edit_apart('cat', 'cast')).to eq(true)
		expect(one_edit_apart('cat', 'cut')).to eq(true)
		expect(one_edit_apart('ab', 'abc')).to eq(true)
		expect(one_edit_apart('abc', 'ab')).to eq(true)
		expect(one_edit_apart('abc', 'adc')).to eq(true)	
		expect(one_edit_apart('abc', 'abcd')).to eq(true)
		expect(one_edit_apart('bab', 'ab')).to eq(true)		
		expect(one_edit_apart('bc', 'abc')).to eq(true)
		expect(one_edit_apart('bcd', 'abcd')).to eq(true)
		expect(one_edit_apart("ab", "abc")).to eq(true)
		expect(one_edit_apart("abc", "adc")).to eq(true)
		expect(one_edit_apart("abc", "ab")).to eq(true)
		expect(one_edit_apart("abc", "abc")).to eq(false)
		expect(one_edit_apart("abc", "axyz")).to eq(false)
		expect(one_edit_apart("cats", "cat")).to eq(true)
	end

end