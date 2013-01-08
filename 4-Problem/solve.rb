class String
  def is_palindrome?
    return true if length <= 1
    return false unless self[0] == self[-1]
    self[1...-1].is_palindrome?
  end
end

nums_to_check = []

(800..999).each do |i|
  (800..999).each do |j|
    nums_to_check << [i * j, i, j]
  end
end

nums_to_check.sort!{ |x, y| y[0] <=> x[0] }
answer = nil

nums_to_check.each do |i|
  if i[0].to_s.is_palindrome?
    answer = i 
    break
  end
end

puts "#{answer[0]} (#{answer[1]} * #{answer[2]})"
