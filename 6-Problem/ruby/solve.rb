sum_of_squares = (1..100).inject(0){|sum, num| sum + num ** 2 }
square_of_sum = (1..100).inject(0){|sum, num| sum + num } ** 2
answer = square_of_sum - sum_of_squares

puts "#{answer} (#{square_of_sum} - #{sum_of_squares})"
