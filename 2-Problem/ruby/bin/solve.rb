require File.dirname( File.expand_path( __FILE__) ) + "/../lib/Fib.rb"

nums = Fib.under(4_000_001)
puts nums.inject(0){|sum, num| num % 2 == 0 ? sum + num : sum }
