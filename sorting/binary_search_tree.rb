# Class to define a node in the binary tree
class Node
  attr_accessor :data, :left, :right, :key, :level

  def initialize(key, data, level=0)
    @key = key
    @data = data
    @left = nil
    @right = nil
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

  def visible_left_nodes(node = @root, order=0)
    # puts 'vis:' + node.inspect
    cur = node
    visible_left = [[cur.level, order, node]]
    visible_left += visible_left_nodes(cur.left, order+1) if cur.left
    visible_left += visible_left_nodes(cur.right, order+2) if cur.right
    if node == @root
      lev = 0
      nodes = []
      done = false
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
end

def build_binary_tree(ar)
  tree = BinaryTree.new
  ar.each{|key, element| tree.insert(key, element)}
  tree
end