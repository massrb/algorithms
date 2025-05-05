class Node
  attr_accessor :value, :left, :right, :height

  def initialize(value)
    @value = value
    @left = @right = nil
    @height = 1
  end
end

# AVL tree is a type of self-balancing binary search tree (BST) 
# named after its inventors Adelson-Velsky and Landis.
# 
# In a regular binary search tree, inserting or deleting nodes 
# can make the tree unbalanced, which hurts performance.
# An AVL tree automatically balances itself after insertions 
# and deletions to maintain efficient operations.

class AVLTree
  def insert(root, value)
    return Node.new(value) if root.nil?

    if value < root.value
      root.left = insert(root.left, value)
    else
      root.right = insert(root.right, value)
    end

    root.height = 1 + [height(root.left), height(root.right)].max
    balance = get_balance(root)

    # Left Left
    if balance > 1 && value < root.left.value
      return rotate_right(root)
    end

    # Right Right
    if balance < -1 && value > root.right.value
      return rotate_left(root)
    end

    # Left Right
    if balance > 1 && value > root.left.value
      root.left = rotate_left(root.left)
      return rotate_right(root)
    end

    # Right Left
    if balance < -1 && value < root.right.value
      root.right = rotate_right(root.right)
      return rotate_left(root)
    end

    root
  end

  def in_order(root, result = [])
    return result if root.nil?

    in_order(root.left, result)
    result << root.value
    in_order(root.right, result)

    result
  end

  private

  def height(node)
    node&.height || 0
  end

  def get_balance(node)
    return 0 if node.nil?
    height(node.left) - height(node.right)
  end

  def rotate_right(y)
    x = y.left
    t2 = x.right

    x.right = y
    y.left = t2

    y.height = 1 + [height(y.left), height(y.right)].max
    x.height = 1 + [height(x.left), height(x.right)].max

    x
  end

  def rotate_left(x)
    y = x.right
    t2 = y.left

    y.left = x
    x.right = t2

    x.height = 1 + [height(x.left), height(x.right)].max
    y.height = 1 + [height(y.left), height(y.right)].max

    y
  end
end

# Tree sort using AVL
def avl_tree_sort(arr)
  tree = AVLTree.new
  root = nil

  arr.each do |val|
    root = tree.insert(root, val)
  end

  tree.in_order(root)
end
