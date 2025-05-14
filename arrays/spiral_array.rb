
class Spiral
  def self.gen_spiral(n)
    raise ArgumentError, "N must be > 0" if n <= 0

    dc = [1, 0, -1, 0]
    dr = [0, 1, 0, -1]
    dir = 0
    val = 0
    r = 0
    c = 0
    limit = n * n
    matrix = Array.new(n) { Array.new(n, 0) }

    while val < limit
      val += 1
      matrix[r][c] = val
      r += dr[dir]
      c += dc[dir]

      if is_invalid?(matrix, r, c)
        r -= dr[dir]
        c -= dc[dir]
        dir = (dir + 1) % 4
        r += dr[dir]
        c += dc[dir]
      end
    end

    matrix
  end

  private

  def self.is_invalid?(matrix, r, c)
    r < 0 || c < 0 || r >= matrix.length || c >= matrix.length || matrix[r][c] != 0
  end
end