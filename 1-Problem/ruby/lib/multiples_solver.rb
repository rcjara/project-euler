class MultiplesSolver
  def self.solve(num)
    1.upto(num - 1).inject(0) do |total, n|
      if n % 3 == 0 || n % 5 == 0
        total + n
      else
        total
      end
    end
  end
end
