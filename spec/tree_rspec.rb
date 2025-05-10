
require_relative '../trees/subtree_nodes'

RSpec.describe "Tree test" do

  it 'find sub nodes' do
  	node1 = Node.new(1)
    node2 = Node.new(2)
    node3 = Node.new(3)
    node1.children = [node2, node3]

	s = "aba"
	queries = [Query.new(1, 'a'), Query.new(2, 'b')]

	expect(count_of_nodes(node1, queries, s)).to eq([2,1])
  end

end

