letter_hash = {'"' => 0}
('A'..'Z').each_with_index {|letter, i| letter_hash[letter] = i + 1 }

text = File.read(File.dirname( File.expand_path( __FILE__) ) + "/../downloaded/names.txt")

names = text.split(/,/).sort
puts names.length

answer = names.each.with_index.inject(0) do |sum, name| 
  sum + (name[1] + 1) * name[0].each_char.inject(0) {|s, ltr| s + letter_hash[ltr] }
end

puts answer
