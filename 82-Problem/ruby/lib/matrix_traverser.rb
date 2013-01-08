class MatrixTraverser
  INF = 1.0 / 0

  def initialize(matrix)
    @orig_matrix = matrix
    @matrix = dup_matrix(@orig_matrix)
  end

  def dup_matrix(matr)
    matr.collect{|row| row.dup }
  end

  def val_at(coord)
    row, col = coord
    @matrix[row][col]
  end

  def print_matrix(matr)
    puts matr.collect{|row| row.join(", ") }.join("\n")
  end

  def print_orig_matrix
    print_matrix(@orig_matrix)
  end

  def print_cur_matrix
    print_matrix(@matrix)
  end

  def min_path_sum
    dest = @orig_matrix[0].length - 1
    height = @orig_matrix.length
    (1...dest).each do |col|
      new_matrix = dup_matrix(@matrix)
      (0...height).each do |row|
        new_matrix[row][col] = min_sum_to([row, col])
      end
      @matrix = new_matrix
    end

    (0...height).inject(INF) do |min, row|
      spot_total = val_at([row, dest - 1]) + val_at([row, dest])
      spot_total < min ? spot_total : min
    end
  end

  def min_sum_to(coord)
    min_found = INF
    paths_to(coord).each do |path|
      path_total = 0

      path.each do |step|
        path_total += val_at(step)
        break if path_total > min_found
      end

      min_found = path_total if path_total < min_found
    end

    min_found
  end

  def paths_to(coord)
    targ_row, targ_col = coord
    row_order_for_paths(targ_row).collect do |row|
      path_from_row_to(row, targ_row, targ_col)
    end
  end

  def row_order_for_paths(targ_row)
    top = bottom = targ_row
    max = @orig_matrix.length
    order_array = [targ_row]
    while top > 0 || bottom < max
      top -= 1
      order_array << top if top >= 0
      bottom += 1
      order_array << bottom if bottom < max
    end

    order_array
  end

  def path_from_row_to(row, targ_row, targ_col)
    start = [row, targ_col - 1]
    path = [start]
    direction = row < targ_row ? 1 : -1
    while row != targ_row
      path << [row, targ_col]
      row += direction
    end
    path << [targ_row, targ_col]
  end

end
