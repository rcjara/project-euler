require File.dirname( File.expand_path( __FILE__) ) + "/../../shared_ruby/euler.rb"

nums = []
(0..9).to_a.permutation(10).each do |perm|
  next if perm[0] == 0
  found = true
  perm.each_cons(3).with_index do |a, i|
    next if i == 0
    unless (a[0] * 100 + a[1] * 10 + a[2]) % Primes[i-1] == 0
      found = false
      break
    end
  end
  nums << perm.join.to_i if found
end

ans = nums.inject(0){|s, n| s + n}

puts ans
puts nums.join(", ")

