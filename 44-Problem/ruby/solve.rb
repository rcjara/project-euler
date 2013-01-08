require File.dirname( File.expand_path( __FILE__) ) + "/../../shared_ruby/euler.rb"
j = 1
p = 2

until (p.to_pent - j.to_pent).is_pent? && (p.to_pent + j.to_pent).is_pent?
  if p - j == 1
    p += 1
    j = 1
  else
    j += 1
  end
end

puts p.to_pent - j.to_pent
