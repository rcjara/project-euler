
def match?(num)
  digits = ordered_digits(num * 2)
  (3..6).each{|i| return false unless same_digits?(digits, i * num) }
  true
end
def same_digits?(digits, other)
  digits == ordered_digits(other)
end

def ordered_digits(num)
  num.to_s.split(//).sort
end

i = 0

while true
  i += 1
  break if match?(i)
end

puts i
