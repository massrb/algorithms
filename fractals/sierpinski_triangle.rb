
def sierpinski_triangle(depth)
  size = 2 ** depth
  triangle = Array.new(size) { ' ' * (2 * size) }

  def draw(triangle, x, y, size)
    if size == 1
      triangle[y][x] = '*'
    else
      half = size / 2
      draw(triangle, x, y, half)                       # top
      draw(triangle, x - half, y + half, half)         # bottom left
      draw(triangle, x + half, y + half, half)         # bottom right
    end
  end

  draw(triangle, size, 0, size)

  triangle.each { |line| puts line.rstrip }
end

sierpinski_triangle(5)