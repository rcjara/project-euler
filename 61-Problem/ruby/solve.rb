require_relative "../../shared_ruby/euler.rb"

def continue(sequence)
  return 0 if sequence.empty?
  new_fract = Fract.new(1, continue(sequence[1..-1]) + sequence[0]).reduce
end

sequence = 0.upto(98).collect do |i|
  i % 3 == 1 ? (i / 3 + 1) * 2 : 1
end

fract = continue(sequence)
fract = Fract.new(fract.num + 2 * fract.den, fract.den).reduce
puts fract.num.sum_of_digits


