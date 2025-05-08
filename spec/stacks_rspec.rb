
require_relative '../stacks/balanced_brackets'

RSpec.describe "stacks test" do
  it 'balanced brackets' do
  	expect(balanced('{[()]}')).to eq(true)
  	expect(balanced('{(})')).to eq(false)	
  end

end