require "set"

keys = File.read(File.dirname( File.expand_path( __FILE__) ) + "/../downloaded/key.txt") 

key_entries = keys.split(/\n/).collect{|s| s.split(//) }
uniq_codes = Set.new
key_entries.each{|code| code.each {|digit| uniq_codes << digit } }

possible_codes = uniq_codes.to_a.permutation(uniq_codes.length).to_a

key_entries.each do |entry|
  possible_codes.reject! do |pos|
    a = pos.index(entry[0])
    b = pos.index(entry[1])
    c = pos.index(entry[2])
    a > b || a > c || b > c
  end

  break if possible_codes.length == 1
end

puts possible_codes[0].join

