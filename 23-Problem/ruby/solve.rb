require File.dirname( File.expand_path( __FILE__) ) + "/../../21-Problem/ruby/lib/Divisors.rb"
require File.dirname( File.expand_path( __FILE__) ) + "/lib/binary_search.rb"

abuns = (1..28123).select{|n| Divisors.sum_divisors(n, true) > n }

def sum_of_abuns?(n, abuns)
  abuns.each do |a|
    return false if a > n / 2
    return true if BinarySearch.exists?(abuns, n - a)
  end
end

not_sum_of_abuns = (1..28123).select do |i|
  !sum_of_abuns?(i, abuns)
end

ans = not_sum_of_abuns.inject(0){|s, n| s + n }



puts ans
