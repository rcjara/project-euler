require File.dirname( File.expand_path( __FILE__) ) + "/../../shared_ruby/euler.rb"

i = 9

while true
  unless Primes.is_prime?(i)
    found_j = false
    Primes.below(i).each do |pr|
      j = 1
      j += 1 while pr + 2 * j ** 2 < i
      if pr + 2 * j ** 2 == i
        found_j = true
        break
      end
    end
    break unless found_j
  end
  i += 2
end

puts i
