require File.dirname( File.expand_path( __FILE__) ) + "/../lib/Primes.rb"

original_num = 600851475143

factors = Primes.factorization(original_num)


puts "Prime Factors: #{factors.join(", ")}"
puts "Highest Prime Factor: #{factors[-1]}"
