max = 0
fa, fb = nil, nil

(2..100).each do |a|
  (2..100).each do |b|
    total = (a ** b).to_s.each_char.inject(0){|s, chr| s + chr.to_i }
    if total > max
      max = total
      fa, fb = a, b
    end
  end
end

puts "#{max} (#{fa}, #{fb})"
