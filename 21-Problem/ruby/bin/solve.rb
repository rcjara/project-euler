require File.dirname( File.expand_path( __FILE__) ) + "/../lib/amicable.rb"

ans = (1...10000).select do |i| 
  pair = Amicable.pair(i) 
  pair && pair < 10000
end.inject(0){ |s, n| s + n}

puts ans
