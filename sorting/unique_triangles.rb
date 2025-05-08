# Given a list of N triangles with integer 
# side lengths, determine how many different 
# triangles there are. Two triangles are 
# considered to be the same if they can both 
# be placed on the plane such that their 
# vertices occupy exactly the same three points.



def count_unique_triangles(triangles)
  unique = Set.new

  triangles.each do |sides|
    unique.add(sides.sort)
  end

  unique.size
end

# Example usage
triangles = [
  [3, 4, 5],
  [5, 4, 3],
  [2, 2, 3],
  [2, 3, 2],
  [3, 2, 2]
]

puts count_unique_triangles(triangles) 