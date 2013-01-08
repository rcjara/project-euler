GOAL_VAL = 200

VALS = [200, 100, 50, 20, 10, 5, 2, 1]

#VALS = [200, 100, 50, 1]

def given(array = [])
  i = cur_val = 0
  until array[i].nil?
    cur_val += array[i] * VALS[i]
    i += 1 
  end
  return [array] if cur_val == GOAL_VAL
  combos = []
  if VALS[i] > 1
    (0..((GOAL_VAL - cur_val) / VALS[i])).each do |num_coins|
      combos += given( array + [num_coins] )
    end
    return combos
  else
    return [array + [GOAL_VAL - cur_val] ]
  end
end

ans = given

view = ans.collect do |array|
  (array + [0] * (VALS.length - array.length)).join(", ")
end.join("\n")

puts view
puts ans.length
