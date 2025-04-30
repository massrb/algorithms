
def bfs(graph, start_node)
  visited = Set.new
  queue = [start_node]
  result = ''
  until queue.empty?
    current = queue.shift
    next if visited.include?(current)
    result << current
    visited.add(current)

    neighbors = graph[current] || []
    neighbors.each do |neighbor|
      queue << neighbor unless visited.include?(neighbor)
    end
  end
  result
end


def dfs(graph, start_node, visited = Set.new)
  return if visited.include?(start_node)

  result = start_node
  visited.add(start_node)

  (graph[start_node] || []).each do |neighbor|
    result << dfs(graph, neighbor, visited).to_s
  end
  result
end
