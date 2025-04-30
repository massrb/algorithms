
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

  it 'has breadth first search' do
  	expect(bfs(graph, "A")).to eq('ABCDE')
  end

  it 'has depth first search' do
  	expect(dfs(graph2, "A")).to eq('ABDECF')
  end

end