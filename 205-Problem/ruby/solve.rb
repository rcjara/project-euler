INF = 1.0 / 0

def ns_for(num_dice, sides, max = INF, prev_dice = [], accumulator = Hash.new(0))
  sum = prev_dice.reduce(0, :+)
  return accumulator if sum > max

  if prev_dice.length == num_dice
    accumulator[sum] += 1
    return accumulator
  end

  sides.each do |side|
    ns_for(num_dice, sides, max, prev_dice + [side], accumulator)
  end
  accumulator
end

def probs_for(num_dice, sides, max = INF)
  accumulator = ns_for(num_dice, sides, max)
  total_n = sides.length ** num_dice
  accumulator.each_pair do |key, n|
    accumulator[key] = n.to_f / total_n
  end
end


fours = probs_for(9, (1..4).to_a)
sixes = probs_for(6, (1..6).to_a)

puts "fours_prob: #{fours.values.reduce(:+)}"

puts "sixes"
puts "-" * 20

sixes_total = 0
sixes.keys.sort.each do |six_key|
  sixes_total += sixes[six_key]
  sixes[six_key] = sixes_total
  puts "#{six_key}: #{sixes[six_key]}"
end

total_prob = 0
fours.each_pair do |four_key, four_val|
  total_prob += four_val * sixes[four_key - 1]
end


puts "Prob of four beating six: #{total_prob}"
