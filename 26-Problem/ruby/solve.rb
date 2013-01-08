require "flt"
include Flt

DecNum.context.precision = 10000

class String
  def find_repeat
    return nil if self.empty?
    (1..(self.length / 3) ).each do |end_i|
      len = end_i
      section = self[0...(end_i)]
      section2 = self[end_i...(end_i + len)]
      next unless section == section2
      section3 = self[(end_i + len)...(end_i + 2 * len)]
      return section if section == section3
    end
    self[1..-1].find_repeat
  end
end

puts "aaaaaa".find_repeat
puts "bcdaaaa".find_repeat
puts "abababab".find_repeat
puts "thisthathellotherehellotherehellothere".find_repeat
puts "didn't find" unless "abcdefghijklmnop".find_repeat

highest_repeat, final_num, final_rep = 0, 0, ""

(2...1000).each do |num|
  rep = (DecNum(1) / DecNum(num)).to_s[2..-1].find_repeat
  if rep && rep.length > highest_repeat
    highest_repeat = rep.length
    final_num = num
    final_rep = rep
  end
end

puts "#{final_num} (#{highest_repeat}, #{final_rep})"
