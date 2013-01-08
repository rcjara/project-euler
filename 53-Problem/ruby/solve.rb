require File.dirname( File.expand_path( __FILE__) ) + "/../../shared_ruby/euler.rb"
i = 23
ans = 0

until i > 100
  r = 1
  r += 1 until i.choose(r) > 1_000_000
  ans += i - 2 * r + 1

  i += 1
end

puts ans
