require File.dirname( File.expand_path( __FILE__) ) + "/../../shared_ruby/euler.rb"

low = Fract.new(1, 3)
high = Fract.new(1, 2)
found_terms = {}
(3..12_000).each do |d|
  num = (d / 3.0).ceil
  cur_fract = Fract.new(num, d)
  while cur_fract <= low
    num += 1
    cur_fract = Fract.new(num, d)
  end
  while cur_fract < high
    found_terms[cur_fract.reduce.terms] = true
    num += 1
    cur_fract = Fract.new(num, d)
  end
end

puts found_terms.length
