class ThreeNSequence
  def self.sequence
    @@sequence ||= {1 => 0}
  end

  def self.solve_for(x)
    return sequence[x] if sequence[x]
    answer = if x % 2 == 0
      solve_for(x / 2)
    else
      solve_for(x * 3 + 1)
    end + 1
    sequence[x] = answer
    answer
  end
end
