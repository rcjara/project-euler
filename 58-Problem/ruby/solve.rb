require File.dirname( File.expand_path( __FILE__) ) + "/../../shared_ruby/euler.rb"

side_length = 4

i = 9
primes_found = 3
composites_found = 2

until primes_found / (primes_found + composites_found).to_f < 0.1
  s = 0
  while s < 4
    i += side_length
    if Primes.is_prime? i
      primes_found += 1
    else
      composites_found += 1
    end
    s += 1
  end
  side_length += 2
end

puts side_length - 1

