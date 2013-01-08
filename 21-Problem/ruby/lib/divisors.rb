class Divisors
  def self.divisors(i, proper = false)
    ds = proper ? [1] : [1, i]
    upper_limit = (i + 1) / 2
    little = 1
    big = i

    while true
      little += 1
      if i % little == 0
        big = i / little
        if little < big
          ds << little
          ds << big
        elsif little == big
          ds << little
          break
        else
          break
        end
      end
      break if little >= upper_limit
    end
    ds
  end

  def self.sum_divisors(i, proper = false)
    divisors(i, proper).inject(0){ |sum, num| sum + num }
  end
end
