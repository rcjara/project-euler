require File.dirname( File.expand_path( __FILE__) ) + "/../../../shared_ruby/euler.rb"

text = File.read( File.dirname( File.expand_path( __FILE__ ) ) + "/../../downloaded/words.txt")

ans = 0
text.split(/,/).each { |word| ans += 1 if Triangles.is?(word.score) }

puts ans
