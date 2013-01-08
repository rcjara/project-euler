def complete_triangle(a, d, m = nil, b = nil, c = nil)
  b ||= a + 1
  c ||= d - b - a
  while b < c
    sub_t = a ** 2 + b ** 2
    c_2 = c ** 2
    return [a, b, c] if sub_t == c_2
    return nil if sub_t > c_2
    b += 1
    c -= 1
  end
  nil
end

max_triangles = 0
f_num = nil

(10..1000).each do |num|
  num_triangles = 0
  (1..(num - 2)).each do |a|
    num_triangles += 1 if complete_triangle(a, num)
  end
  if num_triangles > max_triangles
    max_triangles = num_triangles 
    f_num = num
  end
end

puts "#{f_num} (#{max_triangles})"
