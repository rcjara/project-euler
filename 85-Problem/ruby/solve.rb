def num_rectangles(h, w)
  (1..w).inject(0) do |sum, width|
    (1..h).inject(0) do |s, height|
      s + (h - height + 1) * (w - width + 1)
    end + sum
  end
end

h = 1
w = 1

h += 1 while num_rectangles(h, w) < 2_000_000

max_h = h
max_w = max_h / 2

nearest = (2_000_000 - num_rectangles(h, w) ).abs
nearest_area = h * w

h = max_h

(1..max_w).each do |w|
  num_rects = num_rectangles(h, w)
  prev = (2_000_000 - num_rects).abs
  puts "#{w}, #{h}"
  until prev <= nearest || num_rects + nearest < 2_000_000
    h -= 1
    num_rects = num_rectangles(h, w)
    prev = (2_000_000 - num_rects).abs
    if prev < nearest
      nearest = prev
      max_h = h
      nearest_area = h * w
    end
  end
end

puts nearest_area


