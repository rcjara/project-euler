require File.dirname( File.expand_path( __FILE__) ) + "/../../shared_ruby/euler.rb"

def truncatable?(num)
  l = num.to_s.length - 1
  left = num
  right = num
  l.times do
    left = left.truncate_lft
    return false unless Primes.is_prime?(left)
    right = right.truncate_rgt
    return false unless Primes.is_prime?(right)
  end

  true
end

puts truncatable?(23) ? "23 good" : "23 bad"
truncatable = []
i = 5

until truncatable.length == 11
  i += 1
  test = Primes[i]
  if truncatable?(test)
    truncatable << test 
    puts test
  end
end

ans = truncatable.inject(0){|s, n| s + n }

puts "#{ans} (#{truncatable.join(", ")})"
