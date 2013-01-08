require File.dirname( File.expand_path( __FILE__) ) + "/../../shared_ruby/euler.rb"
answer = 0
loops = []
(1..1_000_000).each do |num|
  counter = 0
  visited_this_round = {}
  t_num = num
  until visited_this_round[t_num] || loops[t_num]
    visited_this_round[t_num] = true
    t_num = t_num.each_digit.inject(0){|s, n| n.fact + s }
    counter += 1
  end
  pre = loops[t_num] ? loops[t_num] : 0
  total = counter + pre
  loops[num] = total
  answer += 1 if total == 60
end

puts answer
