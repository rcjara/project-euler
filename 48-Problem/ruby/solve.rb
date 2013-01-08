def last_x_digits(num, digits = 10)
  num % 10 ** digits
end

total = (1..1000).inject(0){|sum, num| sum + last_x_digits(num ** num) }
puts last_x_digits(total)
