require File.dirname( File.expand_path( __FILE__) ) + "/../../shared_ruby/euler.rb"
num_circ_primes = 0

Primes.below(1_000_000).each do |num|
  found = num.other_rotations.inject(true) do |m, rot| 
    break unless Primes.is_prime?(rot)
    true
  end
  if found
    num_circ_primes += 1
    puts num
  end
end

puts num_circ_primes
