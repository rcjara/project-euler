require File.dirname( File.expand_path( __FILE__) ) + "/../../shared_ruby/euler.rb"

def hgst_n_pan_digit_prime
  n = 9
  while n > 2
    (1..n).to_a.permutation.sort{|a, b| b.join.to_i <=> a.join.to_i }.each do |perm|
      i = perm.join.to_i
      return i if Primes.is_prime?(i)
    end

    n -= 1
  end
  nil
end

puts hgst_n_pan_digit_prime
