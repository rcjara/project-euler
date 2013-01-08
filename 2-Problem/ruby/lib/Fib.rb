class Fib
  def self.[] (x)
    add_to_sequence while sequence.length <= x
    sequence[x]
  end
    
  def self.first(x)
    add_to_sequence while sequence.length <= x
    sequence[0...x]
  end

  def self.under(x)
    add_to_sequence while sequence[-1] < x
    i = index(x).abs
    sequence[0..i]
  end

  #returns a negative value if the number does not exist
  def self.index(x)
    add_to_sequence while sequence[-1] < x
    tunnel(x, sequence.length - 1)
  end

  def self.tunnel(x, i, x_log_val = nil)
    return i if sequence[i] == x
    i_log_val = Math.log(sequence[i]) / Math.log(2)
    x_log_val ||= Math.log(x) / Math.log(2)
    di = x_log_val.to_i - i_log_val.to_i

    if di == 0
      if sequence[i + 1] && sequence[i + 1] < x
        return -(i + 1)
      elsif sequence[i] < x
        return -i
      else
        return -(i - 1)
      end
    end

    tunnel(x, i + di, x_log_val)
  end

  def self.add_to_sequence
    sequence << sequence[-1] + sequence[-2]
  end

  def self.sequence
    @@sequence ||= [1, 1]
  end
end
