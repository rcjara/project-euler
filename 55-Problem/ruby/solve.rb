require File.dirname( File.expand_path( __FILE__) ) + "/../../shared_ruby/euler.rb"
def lychrel?(num, attempt = 0)
  num += num.reverse
  return true unless attempt < 51
  return false if num.palindrome?
  lychrel?(num, attempt + 1)
end

ans = 0

(0...10_000).each do |num|
  ans += 1 if lychrel?(num)
end

puts ans
