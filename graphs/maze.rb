module Maze

  def self.find_start(maze)
    maze.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        return [y, x] if cell == 'S'
      end
    end
  end

  # BFS guarantees the shortest path in unweighted graphs
  # 
  # If we used recursion, that would be depth first effectively
  # 
  
  def self.shortest_path(maze)
    start = find_start(maze)
    queue = [[start, [start]]]  # [position, path_taken]
    visited = { start => true }

    directions = [[-1, 0], [1, 0], [0, -1], [0, 1]]  # up, down, left, right

    until queue.empty?
      (y, x), path = queue.shift

      return path if maze[y][x] == 'E'

      directions.each do |dy, dx|
        ny, nx = y + dy, x + dx
        next if ny < 0 || nx < 0 || ny >= maze.size || nx >= maze[0].size

        next_pos = [ny, nx]
        next_cell = maze[ny][nx]

        next if next_cell == '#' || visited[next_pos]

        visited[next_pos] = true
        queue << [next_pos, path + [next_pos]]
      end
    end

    nil  # No path found
  end


  def self.dfs(maze, y, x, visited)
    return false if y < 0 || x < 0 || y >= maze.size || x >= maze[0].size
    return false if maze[y][x] == '#' || visited[[y, x]]

    visited[[y, x]] = true

    return true if maze[y][x] == 'E'

    # Explore all directions: up, down, left, right
    [[-1, 0], [1, 0], [0, -1], [0, 1]].each do |dy, dx|
      ny, nx = y + dy, x + dx
      return true if dfs(maze, ny, nx, visited)
    end

    false
  end

  def self.solvable?(maze)
    start_y, start_x = find_start(maze)
    visited = {}
    dfs(maze, start_y, start_x, visited)
  end
end
