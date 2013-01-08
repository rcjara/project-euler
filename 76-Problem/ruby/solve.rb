GOAL_VAL = 100

possibilities = [[1], [1, 2]]

def solve_for_num(num, possibilities)
  possible_vals = (1...num).to_a.reverse
  regress_on_num(num, 0, possible_vals, num) 
end

def regress_on_num(num, position, possible_vals, remainder)
  return 1 if remainder < 2 || possible_vals[position] == 1
  return_val = 0
  running_total = 0
  while running_total <= remainder
    to_pass = remainder - running_total
    return_val += regress_on_num(num, position + 1, possible_vals, to_pass)
    running_total += possible_vals[position]
  end
  return_val
end

(GOAL_VAL..GOAL_VAL).each do |num|
  total_for_num = solve_for_num(num, possibilities)
  puts "#{num}: #{total_for_num}"
end



