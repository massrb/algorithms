
=begin

problem seems a little confusing because the description does not
spell out any tree structure only the example does but how is that clear - not sure.

Nodes in a Subtree
You are given a tree that contains N nodes, each 
containing an integer u which corresponds to a lowercase 
character c in the string s using 1-based indexing.
You are required to answer Q queries of type [u, c], where u 
is an integer and c is a lowercase letter. The query result is 
the number of nodes in the subtree of node u containing c.

Signature
int[] countOfNodes(Node root, ArrayList<Query> queries, String s)

Input
A pointer to the root node, an array list containing Q queries of type [u, c], and a string s

Constraints
N and Q are the integers between 1 and 1,000,000
u is a unique integer between 1 and N
s is of the length of N, containing only lowercase letters
c is a lowercase letter contained in string s
Node 1 is the root of the tree

Output
An integer array containing the response to each query

Example
        1(a)
        /   \
      2(b)  3(a)

s = "aba"
RootNode = 1
queries = [[1, 'a']]

Note: Node 1 corresponds to first letter 'a', Node 2 
corresponds to second letter of the string 'b', Node 3 
corresponds to third letter of the string 'a'.
output = [2]

Both Node 1 and Node 3 contain 'a', 
so the number of nodes within the subtree of Node 1 containing 'a' is 2.
=end

class Node
  attr_accessor :val, :children

  def initialize(val)
    @val = val
    @children = []
  end
end

Query = Struct.new(:u, :c)

def count_of_nodes(root, queries, s)
  # Map from node value to subtree character frequency hash
  @subtree_counts = {}

  # DFS to populate @subtree_counts
  def dfs(node, s)
    freq = Hash.new(0)
    char = s[node.val - 1]
    freq[char] += 1

    node.children.each do |child|
      child_freq = dfs(child, s)
      child_freq.each { |k, v| freq[k] += v }
    end

    @subtree_counts[node.val] = freq
    freq
  end

  dfs(root, s)

  # Resolve each query
  result = []
  queries.each do |query|
    node_val = query.u
    char = query.c
    result << (@subtree_counts[node_val][char] || 0)
  end

  result
end