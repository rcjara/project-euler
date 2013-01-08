require File.dirname( File.expand_path( __FILE__) ) + "/divisors.rb"

class Amicable
  def self.pair(num)
    pair = Divisors.sum_divisors(num, true)
    Divisors.sum_divisors(pair, true) == num && pair != num ? pair : nil
  end
end
