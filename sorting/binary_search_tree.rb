# Class to define a node in the binary tree
class Node
  attr_accessor :data, :left, :right, :key, :level

  def initialize(key, data, level=0)
    @key = key
    @data = data
    @left = nil
    @right = nil
    # depth into tree, root = 0
    # child of root = 1
    # grandchild of root = 2 etc
    @level = level
  end
end

# BinaryTree class to handle insertion (non-AVL, no balancing)
class BinaryTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  # Insert method to add a node to the binary tree
  def insert(key, data)
    if @root.nil?
      @root = Node.new(key, data)
    else
      insert_recursively(@root, key, data)
    end
  end

  # Recursive insertion without balancing
  def insert_recursively(current_node, key, data)
    next_level = current_node.level + 1
    if key < current_node.key
      if current_node.left.nil?
        current_node.left = Node.new(key, data, next_level)
      else
        insert_recursively(current_node.left, key, data)
      end
    else
      if current_node.right.nil?
        current_node.right = Node.new(key, data, next_level)
      else
        insert_recursively(current_node.right, key, data)
      end
    end
  end

  def max_imbalance(node)
    return 0 if node.nil?

    left_height = height(node.left)
    right_height = height(node.right)
    imbalance = (left_height - right_height).abs

    [imbalance, max_imbalance(node.left), max_imbalance(node.right)].max
  end

  def height(node)
    return 0 if node.nil?
    1 + [height(node.left), height(node.right)].max
  end

  def search(key)
    cur = @root
    result = []
    while cur do
      if cur&.key == key
        result << cur
        cur = cur.right
      elsif key < cur&.key
        cur = cur.left
      else
        cur = cur.right
      end  
    end
    result
  end

  def print_node(node)
    puts node.key
  end

=begin
  def visible_left_nodes(node = @root, order=0)
    # puts 'vis:' + node.inspect
    cur = node
    visible_left = [[cur.level, order, node]]
    # the two calls here will be at the same level
    # but the order being different will differentiate 
    # them such that min_by will always get the one on the left.
    # If the recursive calls go to a deeper level on the right
    # then those nodes may be included in the leftmost nodes even
    # though their ancestors might not be included in the leftmost
    # nodes because the tree might not be balanced.
    visible_left += visible_left_nodes(cur.left, order+1) if cur.left
    visible_left += visible_left_nodes(cur.right, order+2) if cur.right
    if node == @root
      lev = 0
      nodes = []
      done = false
      # for each level we are only going to get
      # one node, that is the minimum node
      # which will coorespond to the leftmost node
      # for that level. The parent of a leftmost node
      # parent may not neccessarily be included in the 
      # collection of leftmost nodes
      while !done
        this_level = visible_left.find_all{|level, order, node| level == lev}
                     .min_by{|level, order, node| [level, order]}
        lev+=1
        if !this_level
          done = true
        else
          nodes += [this_level]
        end
      end
      nodes.map{|level, order, node| node}
    else  
      visible_left
    end  
  end
=end

  def visible_left_nodes(node = @root, level = 0, level_map = {})
    return [] unless node

    # Record the first node we encounter at each level (i.e., the leftmost)
    level_map[level] ||= node

    # Visit left first to ensure leftmost gets recorded first
    visible_left_nodes(node.left, level + 1, level_map)
    visible_left_nodes(node.right, level + 1, level_map)

    # Only return result at root
    return level_map.values if node == @root

    nil
  end

  def print_tree(node, prefix = "", is_left = true)
    return if node.nil?

    # Print the right child
    print_tree(node.right, "#{prefix}   ", false)

    # Print the current node
    puts "#{prefix}#{is_left ? "└── " : "┌── "}#{node.key}"

    # Print the left child
    print_tree(node.left, "#{prefix}   ", true)
  end

  # Method to print the tree in an inorder traversal
  def inorder_traversal(node = @root)
    return if node.nil?

    inorder_traversal(node.left)
    print "#{node.key}:#{node.data} "
    inorder_traversal(node.right)
  end

  def to_sorted_array(node = @root, array = [])
    return array if node.nil?

    to_sorted_array(node.left, array)
    array << node
    to_sorted_array(node.right, array)

    array
  end

  # Build a balanced tree from sorted array of nodes
  def build_balanced_tree(nodes, level = 0)
    return nil if nodes.empty?

    mid = nodes.length / 2
    root = Node.new(nodes[mid].key, nodes[mid].data, level)
    
    root.left = build_balanced_tree(nodes[0...mid], level + 1)
    root.right = build_balanced_tree(nodes[mid+1..-1], level + 1)

    root
  end

  # Balance the tree in-place
  def balance!
    sorted_nodes = to_sorted_array
    @root = build_balanced_tree(sorted_nodes)
  end
end

def build_binary_tree(ar)
  tree = BinaryTree.new
  ar.each{|key, element| tree.insert(key, element)}
  tree
end