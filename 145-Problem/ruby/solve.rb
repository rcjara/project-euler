require_relative "../../shared_ruby/euler.rb"
class Integer
  def first_digit
    self.to_s[0].to_i
  end

  def reverse
    self.to_s.reverse.to_i
  end
end


exp = 2
while exp < 9
  start = Time.now
  i = 12
  j = 0
  ans = 0
  limit = 4

  while i < 10 ** exp
    j = 0
    while j < limit
      reversible = true

      (i + i.reverse).each_digit do |d|
        if d % 2 == 0
          reversible = false
          break
        end
      end

      ans += 1 if reversible

      i += 2
      j += 1
    end
    i = (i / 10) * 10 + if i.first_digit % 2 == 1
      limit = 4
      2
    else
      limit = 5
      1
    end
  end

  puts ans
  puts Time.now - start

  exp += 1
end

