require_relative "../../shared_ruby/euler.rb"
require "set"

def good_solve(upper)
  nums = (0..upper).collect{ |i| i - 1 }
  nums[0] = 0
  ans = 0

  i = 2
  while i <= upper
    ans += nums[i]
    j = i * 2
    while j <= upper
      nums[j] -= nums[i]
      j += i
    end
    i += 1
  end

  ans
end

def naive_solve(upper)
  fracts = {}
  (2..upper).each do |den|
    (1...den).each do |num|
      fract = Fract.new(num, den).reduce
      fracts[fract.terms] = true
    end
  end
  fracts.length
end

upper = 1_000_000
puts good_solve(upper)
puts naive_solve(upper)
