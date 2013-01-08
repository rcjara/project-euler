require_relative "../../shared_ruby/euler.rb"

num_types = [:to_tri, :to_square, :to_pent, :to_hex, :to_hept, :to_oct]
num_sets  = []

def last_two(num)
  num.to_s[2..3]
end

def first_two(num)
  num.to_s[0..1]
end

def possibilities_for(num, depth, sets)
  sets[depth][last_two(num)]
end

def recursive_search_for(accum, indices, sets)
  puts accum.join(",")

  if accum.size >= sets.size
    if last_two(accum.last) == first_two(accum.first)
      return accum
    else
      return false
    end
  end

  indices.each do |i|
    responses = possibilities_for(accum.last, i, sets)
    next unless responses
    responses.each do |response|
      test = recursive_search_for(accum + [response], indices - [i], sets)
      return test if test
    end
  end

  false
end

#assemble the numbers
num_types.each do |sym|
  set = {}
  i = 10
  i += 1 while i.send(sym) < 1_000
  cur_num = i.send(sym)
  while cur_num < 10_000
    key = first_two(cur_num)
    if set[key]
      set[key] << cur_num
    else
      set[key] = [cur_num]
    end
    i += 1
    cur_num = i.send(sym)
  end
  num_sets << set
end

ans = false

num_sets[0].each_value do |tri|
  tri.each do |num|
    ans = recursive_search_for([num], 1.upto(num_sets.length - 1).to_a, num_sets)
    break if ans
  end
  break if ans
end

puts ans.join(",")
puts ans.reduce(:+)
