require File.dirname( File.expand_path( __FILE__) ) + "/../lib/fract.rb"

d = 8
end_fract = Fract.new(3, 7)
highest_found = Fract.new(1, 7)

while d < 1_000_000
  num = ((d / 7.0) * 3).floor - 1
  cur_fract = Fract.new(num , d)
  while cur_fract < end_fract
    highest_found = cur_fract if cur_fract > highest_found
    num += 1
    cur_fract = Fract.new(num, d)
  end
  d += 1
end

puts "#{highest_found.num} / #{highest_found.den}"
