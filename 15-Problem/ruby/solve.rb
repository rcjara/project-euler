def fact(x)
  (1..x).inject(1){|prod, i| prod * i}
end

height = width = 20

puts fact(height + width) / (fact(height) * fact(width))
