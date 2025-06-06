
# Considered hard to do efficiently

# You are given an array of k linked lists, each 
# linked-list is sorted in ascending order.
# Merge all the linked-lists into one sorted linked-list and return it.

# using arrays can be less efficient (due to memory copying and higher time complexity)
# The solution tests understanding of pointers, node traversal, and in-place merging

# Define a basic ListNode structure
class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end

  # Helper to convert linked list to array
  def to_a
    node, result = self, []
    while node
      result << node.val
      node = node.next
    end
    result
  end
end

# Converts an array into a linked list
def build_linked_list(arr)
  return nil if arr.empty?
  head = ListNode.new(arr[0])
  current = head
  arr[1..].each do |val|
    current.next = ListNode.new(val)
    current = current.next
  end
  head
end

# Main function to merge k sorted linked lists
def merge_k_lists(lists)
  nodes = []

  # Collect all values from the linked lists
  lists.each do |head|
    while head
      nodes << head.val
      head = head.next
    end
  end

  # Sort all values and rebuild the final list
  nodes.sort!
  build_linked_list(nodes)
end
