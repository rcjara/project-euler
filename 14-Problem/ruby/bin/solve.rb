require File.dirname( File.expand_path( __FILE__) ) + "/../lib/three_n_sequence.rb"

answer = 0
most_steps = (1..1_000_000).inject(0) do |highest, num|
  this_ans = ThreeNSequence.solve_for(num)
  if this_ans > highest
    answer = num
    this_ans
  else
    highest
  end
end

puts most_steps
puts answer
