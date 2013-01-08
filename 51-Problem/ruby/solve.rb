require_relative "../../shared_ruby/euler"

def indices_for(string, match)
  indices = []
  string.each_char.with_index do |char, i|
    indices << i if char == match
  end
  indices
end

def templates_for(num, sub)
  indices = indices_for(num, sub)
  (2..(indices.length)).inject([]) do |collection, size|
    collection + indices.combination(size).collect do |combo|
      new_num = num.dup
      combo.each do |i|
        new_num[i] = "*"
      end
      new_num
    end
  end
end

def test_num(num, sub, target = 8)
  templates_for(num, sub).each do |template|
    next if template[-1] == "*"

    success = 0
    start = template[0] == "*" ? 1 : 0

    (start..9).each do |digit|
      test_num = template.gsub("*", digit.to_s).to_i

      success += 1  if Primes.is_prime?(test_num)
      return true   if success >= target
      next          if (9 - digit) < (target - success)
    end
  end

  false
end


prime_array = Primes.below(10)
index = prime_array.length
num = prime_array[index]

loop do
  num = Primes[index].to_s
  puts num if index % 1000 == 0
  if num =~ /.*1.*1.*/ 
    break if test_num(num, "1")
  end
    
  if num =~ /.*0.*0.*/
    break if test_num(num, "0")
  end
  index += 1
end

puts "success: " + num
