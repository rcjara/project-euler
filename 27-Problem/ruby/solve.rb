require File.dirname( File.expand_path( __FILE__) ) + "/../../shared_ruby/euler.rb"

highest_chain = 0
fa, fb = nil, nil

possible_bs = Primes.below(1001)

possible_bs.each do |b|
  (-1000..1000).each do |a|
    n = 1
    n += 1 while Primes.is_prime?(n ** 2 + a * n + b)
    if n > highest_chain
      highest_chain = n
      fa, fb = a, b
    end
  end
end

puts "#{fa * fb} (#{fa}, #{fb}, #{highest_chain})"
