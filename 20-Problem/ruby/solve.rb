fact = (1..100).inject(1){|prod, num| prod * num}
puts fact.to_s.each_char.inject(0){|sum, i| sum + i.to_i}
