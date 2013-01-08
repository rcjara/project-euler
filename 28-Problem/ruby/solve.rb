i = 1
inc_by = 2
phase = 0
total = 1

while inc_by <= 1001
  i += inc_by
  total += i
  phase += 1
  phase %= 4
  inc_by += 2 if phase == 0
end

puts total
