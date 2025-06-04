
require_relative '../graphs/graph'
require_relative '../graphs/min_permutations'
require_relative '../graphs/maze'

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
  #   10
  #  /  \
  # 5   20
  #    /  \
  #  15   30
  #      /  \
  #    25   35

  let(:maze) {[
    ['S', ' ', '#', ' '],
    ['#', ' ', '#', ' '],
    ['#', ' ', ' ', ' '],
    ['#', '#', '#', 'E']
  ]}

  it 'has breadth first search' do
  	expect(bfs(graph, "A")).to eq('ABCDE')
  end

  it 'has depth first search' do
  	expect(dfs(graph2, "A")).to eq('ABDECF')
  end

  it 'does minimum permutations' do
    expect(min_operations([3, 1, 2])).to eq(2)
  end

  it 'find way through maze' do
    expect(Maze.solvable?(maze) ).to eq(true)
    expect(Maze.shortest_path(maze)).to eq([[0, 0], [0, 1], [1, 1], [2, 1], [2, 2], [2, 3], [3, 3]])
  end

end