max = (9 ** 5) * 10

def sum_pow_of_digits(num, pow = 5)
  num.to_s.each_char.inject(0) {|s, ch| ch.to_i ** 5 + s }
end

nums = (10..max).select do |num|
  sum_pow_of_digits(num) == num
end

ans = nums.inject(0){|s, n| s + n }

puts "#{ans} (#{nums.join(", ")})"
