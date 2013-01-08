upper_limit = 1

upper_limit += 1 while 9 ** upper_limit > 1 * 10 ** (upper_limit - 1)

puts upper_limit

ans = 0

(1...upper_limit).each do |exp|
  (1..9).each do |num|
    ans += 1 if (num ** exp).to_s.length == exp
  end
end

puts ans
