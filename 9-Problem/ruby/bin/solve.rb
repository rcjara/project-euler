require File.dirname( File.expand_path( __FILE__) ) + "/../lib/pyth_trip.rb"
answer = nil

(335..997).each do |c|
  (2...c).each do |b|
    a = PythTrip.given_b_c(b, c)
    if a && b
      answer = [a, b, c] if a + b + c == 1000
      break if answer
    end
  end
  break if answer
end

puts answer.join(", ")
puts answer.inject(1){|prod, num| prod * num}
