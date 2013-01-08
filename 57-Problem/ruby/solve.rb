require File.dirname( File.expand_path( __FILE__) ) + "/../../shared_ruby/euler.rb"

def next_expansion(prev_expansions)
  fract = prev_expansions[-1]
  fract_2 = prev_expansions[-2]
  prev_expansions + [ [fract[0] * 2 + fract_2[0], fract[1] * 2 + fract_2[1] ] ]
end

ans = 0
i = 3
prev = [[3, 2], [7, 5], [17, 12]]
while i < 1001
  prev = next_expansion(prev)
  numer, denom = prev[-1]
  ans += 1 if numer.to_s.length > denom.to_s.length
  puts "#{i}. #{numer}/#{denom}"
  i += 1
end

puts ans
