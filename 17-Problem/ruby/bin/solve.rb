require File.dirname( File.expand_path( __FILE__) ) + "/../lib/integer_to_english.rb"

ans = (1..1000).inject(0) do |sum, num| 
  num.letter_count + sum
end

puts ans
