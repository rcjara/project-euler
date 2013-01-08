class Fixnum
  def fact
    (2..self).inject(1){|s, n| s * n }
  end

end

class Facts
  def self.[] (x)
    facts[x]
  end

  def self.facts
    @@facts ||= (0..9).collect{|i| i.fact }
  end

  def self.sum_fact_digits(x)
    x.to_s.each_char.inject(0){|s, c| Facts[c.to_i] + s }
  end
end

nums = (10..(9.fact * 7) ).select{|n| Facts.sum_fact_digits(n) == n }

ans = nums.inject(0){|s, n| s + n}
puts "#{ans} (#{nums.join(', ')})"
