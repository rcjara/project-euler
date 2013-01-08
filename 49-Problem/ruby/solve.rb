require File.dirname( File.expand_path( __FILE__) ) + "/../../shared_ruby/euler.rb"

good_perms = []

i = 0
i += 1 while Primes[i] < 1000

while Primes[i] < 10000
  this_num = Primes[i] 
  good_perms = this_num.to_s.split(//).permutation(4).select do |perm|
    num = perm.join.to_i
    num >= this_num && Primes.is_prime?(num)
  end

  good_perms.uniq!

  if good_perms.length > 2
    good_primes = good_perms.collect{|p| p.join.to_i}.sort
    dif = good_primes[1] - good_primes[0]
    if good_primes[2] - good_primes[1] == dif
      puts good_primes.join
    end
  end
  i += 1
end

