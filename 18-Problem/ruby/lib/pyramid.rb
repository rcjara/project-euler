class Pyramid
  def initialize(str)
    @array = str.split(/\n/).collect do |line|
      line.scan(/\d+/).collect { |r| r.to_i }
    end
  end

  def to_a
    @array
  end

  def traverse(path)
    pos = 0
    
    visited = path.collect.with_index do |move_by, i|
      pos += move_by
      @array[i + 1][pos]
    end

    [@array[0][0] ] + visited
  end

  def sum_path(path)
    traverse(path).inject(0) {|sum, num| sum + num }
  end

  def base_level_ideals
    @array[-2].collect.with_index do |num, i|
      num1 = @array[-1][i]
      num2 = @array[-1][i + 1]
      if num1 > num2
        [num + num1, [0]]
      else
        [num + num2, [1]]
      end
    end
  end

  def ideal_from_level_below(j, prev_level)
    @array[j].collect.with_index do |num, i|
      num1 = prev_level[i][0]
      num2 = prev_level[i + 1][0]
      if num1 > num2
        [num + num1, [0] + prev_level[i][1] ]
      else
        [num + num2, [1] + prev_level[i + 1][1] ]
      end
    end
  end

  def find_ideal_path
    prev_levels = base_level_ideals
    j = @array.length - 2
    while j > 0
      j -= 1
      prev_levels = ideal_from_level_below(j, prev_levels)
    end
    prev_levels[0][1]
  end
end
