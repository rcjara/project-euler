class String
  def palindrome?
    return true if length < 2
    return false if self[0] != self[-1]
    self[1...-1].palindrome?
  end
end

ans = (1..1_000_000).inject(0){|s, n| n.to_s.palindrome? && n.to_s(2).palindrome? ? s + n : s }

puts ans
