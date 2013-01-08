require_relative "../lib/roman_numeral"

filename = File.dirname( File.expand_path __FILE__)  + "/../../downloaded/roman.txt"

numerals = File.read(filename).split /\n/

numerals[0..10].each do |line|
  str = line.chomp
  roman = RomanNumeral.new(str).compress!
  savings = str.length - roman.length
  puts "#{str} => #{roman.to_s} | #{savings}"
end

answer = numerals.inject(0) do |sum, line|
  str = line.chomp
  roman = RomanNumeral.new(str).compress!
  sum += str.length - roman.length
end

puts answer
