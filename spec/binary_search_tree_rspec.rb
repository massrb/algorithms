
require_relative '../sorting/binary_search_tree'

RSpec.describe "Sort test" do
  
  let(:unsorted_array) {  [
    [10, 'apples'], 
    [4, 'pears'],
    [8, 'doves'],
    [3, 'cats'],
    [9, 'dogs'],
    [2, 'monkeys'],
    [22, 'donkeys'],
    [33, 'people'],
    [22, 'letters'],
    [7, 'birds'],
    [6, 'fish']] }

  it 'has a working binary search tree' do
    tree = build_binary_tree(unsorted_array)
    expect(tree.search(2)[0].data).to eq('monkeys')
    expect(tree.search(13)).to eq([])
    expect(tree.search(22)[0].data).to eq('donkeys')
    expect(tree.search(22)[1].data).to eq('letters')

    expect(tree.max_imbalance(tree.root)).to eq(2)
    tree.print_tree(tree.root)
    puts '------------'
    expect(tree.visible_left_nodes.map{|node| node.key}).to eq([10, 4, 3, 2, 6])
  end

end