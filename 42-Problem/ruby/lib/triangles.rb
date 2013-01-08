class Triangles
  def self.[] (x)
    (x * (x + 1)) / 2
  end

  def self.below(num)
    i = 1
    series = []
    while Triangles[i] < num
      series << Triangles[i]
      i += 1
    end

    series
  end

  def self.is?(num)
    i = (-1 + Math.sqrt(1 + 8 * num) ) / 2
    self[i.floor] == num || self[i.ceil] == num
  end
end
