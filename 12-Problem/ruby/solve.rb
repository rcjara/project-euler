TARGET_LENGTH = 501

def triangular(i)
  ((1 + i) * (i / 2.0)).to_i
end

def divisors(i)
  ds = [1, i]
  upper_limit = i / 2
  little = 1
  big = i
  while true
    little += 1
    if i % little == 0
      big = i / little
      if little < big
        ds << little
        ds << big
      elsif little == big
        ds << little
        break
      else
        break
      end
    end
    break if little >= upper_limit
  end
  ds
end

highest_length = 0

i = 1
answer = nil
until answer
  i += 1
  tri = triangular(i)
  length = divisors(tri).length
  if length > highest_length 
    puts "#{length} (#{tri})"
    highest_length = length
  end
  answer = tri if length >= TARGET_LENGTH
end

puts "#{answer} (#{i})" 
