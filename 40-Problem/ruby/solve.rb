count = 0
num_s = []
(0..1_000_000).each do |i| 
  s = i.to_s
  count += s.length
  num_s << s
  break if count > 1_000_000
end

big_string = num_s.join

puts "good" if big_string[10].to_i == 1

i = 1
ans = 1
while i < 1_000_000
  i *= 10
  ans *= big_string[i].to_i
end

puts ans
