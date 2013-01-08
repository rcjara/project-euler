source = ('1'..'9').to_a

all_combos = source.permutation(9)

raise "Wrong num permutations" unless all_combos.to_a.length == 1 * 2 * 3 *4 * 5 * 6 * 7 * 8 * 9

found_nums = {}

all_combos.each do |combo|
  first_num = combo[0..1].join.to_i
  second_num = combo[2..4].join.to_i
  third_num = combo[5..8].join.to_i
  found_nums[third_num] = true if first_num * second_num == third_num

  first_num = combo[0..0].join.to_i
  second_num = combo[1..4].join.to_i
  third_num = combo[5..8].join.to_i
  found_nums[third_num] = true if first_num * second_num == third_num
end

ans = found_nums.keys.inject(0){|s, n| s + n}

puts ans
puts found_nums.keys.join(", ")
