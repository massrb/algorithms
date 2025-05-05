require_relative '../misc/string_op'

RSpec.describe "string test" do

	it 'does cyphers' do
		res = StringOp.rotational_cipher('Zebra-493?', 3)
		expect(res).to eq('Cheud-726?')
	end

end