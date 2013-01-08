require File.dirname( File.expand_path( __FILE__) ) + "/../../shared_ruby/euler.rb"

NUM_FACTORS = 4
i = 2
while true
  j = 0
  j += 1 while j < NUM_FACTORS && Primes.uniq_factors(i + j).length == NUM_FACTORS
  break if j == NUM_FACTORS
  i += 1
end

puts i

