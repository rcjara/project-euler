require 'set'

terms = Set.new

(2..100).each do |a|
  (2..100).each do |b|
    terms << a ** b
  end
end

puts terms.length
