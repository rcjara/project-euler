i = 20
answer = nil

until answer
  answer = i
  (3..20).each do |j|
    if i % j > 0
      answer = nil
      break
    end
  end
  i += 2
end

puts answer
