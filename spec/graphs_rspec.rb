
require_relative '../graphs/graph'

RSpec.describe "Graph test" do

 #
 #     A
 #    / \
 #   B   C
 #  / \
 # D   E
 #
 # undirected graph:
 #
  let(:graph) {{
  	"A" => ["B", "C"],
  	"B" => ["A", "D", "E"],
  	"C" => ["A"],
  	"D" => ["B"],
  	"E" => ["B"]
  }}

 #
 #
 #
 #     A
 #    / \
 #   B   C
 #  / \   \
 # D   E   F
 #

  let(:graph2) {{
  "A" => ["B", "C"],
  "B" => ["A", "D", "E"],
  "C" => ["A", "F"],
  "D" => ["B"],
  "E" => ["B"],
  "F" => ["C"]
}}

 # binary search tree
 # 
 # 10
 #  /  \
 # 5   20
 #    /  \
 #  15   30
 #      /  \
 #    25   35

let(:bst) {}

  it 'has breadth first search' do
  	expect(bfs(graph, "A")).to eq('ABCDE')
  end

  it 'has depth first search' do
  	expect(dfs(graph2, "A")).to eq('ABDECF')
  end

end