highest_found = 0
TEST_ARRAY = ('1'..'9').to_a
i = 1
while (i.to_s + (i * 2).to_s).length < 10
  nums = [i]
  running_length = i.to_s.length
  while running_length < 9
    new_num = i * (nums.length + 1)
    nums << new_num
    running_length += new_num.to_s.length
  end

  if running_length == 9
    combo_num = nums.collect(&:to_s).join.to_i
    if combo_num.to_s.split(//).sort == TEST_ARRAY
      highest_found = combo_num if combo_num > highest_found
      puts highest_found.to_s + " (#{i})"
    end
  end
  i += 1
end

puts highest_found
