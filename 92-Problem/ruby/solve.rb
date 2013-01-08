class Numeric
  def square_of_digits
    if self > 9
      (self % 10) ** 2 + (self / 10).square_of_digits
    else
      self ** 2
    end
  end
end

def where_does_it_end(num, chains)
  return 1 if chains[num] == 1
  return 89 if chains[num] == 89
  answer = where_does_it_end(num.square_of_digits, chains)
  chains[num] = answer if num < MAX
  answer
end

MAX = 9_999_999.square_of_digits
chains = []
chains[1] = 1
chains[89] = 89
chains[MAX] = nil

count = 0
(1...10_000_000).each {|n| count += 1 if where_does_it_end(n, chains) == 89 }

puts count

#to_s.each_char.inject(0){|s, ch| s + ch.to_i ** 2 }
