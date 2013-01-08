num = Math.sqrt(10203040506070809).ceil
sq = (num ** 2)

while sq < 20000000000000000
  sq = (num ** 2)
  break if sq.to_s =~ /1\d2\d3\d4\d5\d6\d7\d8\d9/
  if sq.to_s =~ /^1\d2/
    num += 1
  else
    num += 10000 until (num**2).to_s =~ /^1\d2/
    num -= 9999
    num += 1000 until (num**2).to_s =~ /^1\d2/
    num += 999
    num += 100 until (num**2).to_s =~ /^1\d2/
    num -= 99
    num += 10 until (num**2).to_s =~ /^1\d2/
    num -= 9
    num += 1 until (num**2).to_s =~ /^1\d2/
  end
end

puts num * 10

