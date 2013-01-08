class MinPathMatrix
  def initialize(matrix)
    @matrix = matrix
    @total_length = @matrix.length * 2
  end

  def min_sum
    diagonals.each do |diag|
      diag.each do |coord|
        x = coord[0]
        y = coord[1]
        if x + 1 < @matrix.length && y + 1 < @matrix.length
          @matrix[x][y] += if @matrix[x + 1][y] > @matrix[x][y + 1]
            @matrix[x][y + 1]
          else
            @matrix[x + 1][y]
          end
        elsif x + 1 < @matrix.length
          @matrix[x][y] += @matrix[x + 1][y]
        elsif y + 1 < @matrix.length
          @matrix[x][y] += @matrix[x][y + 1]
        end
      end
    end

    @matrix[0][0]
  end

  def diagonals
    (0..(@total_length - 2)).collect do |i|
      diagonal i 
    end
  end

  def diagonal(i)
    j = @total_length - i - 1
    k = 0
    x, y = if j >= @matrix.length
      [j - @matrix.length, @matrix.length - 1]
    else
      [0, j - 1]
    end

    diags = [] 
    while x < @matrix.length && y >= 0
      diags << [x, y]
      x += 1
      y -= 1
    end

    diags
  end

end
