require File.dirname( File.expand_path( __FILE__) ) + "/../../shared_ruby/euler.rb"
END_POINT = 1_000_000

highest_found = 1
found_num = 1
num = 2
while num < END_POINT
  found = 0
  (1...num).each do |i|
    found += 1 if i.highest_common(num) == 1
  end

  if num.to_f / found > highest_found
    highest_found = num.to_f / found
    found_num = num
    puts found_num
  end

  num += found_num
end

puts found_num

