require_relative "../lib/totient.rb"

#new strategy is to compute a two factor compound
#prime and use that totient
#
start = 10
end_point = 10 ** 7
lowest_ratio = 20

def find_ratio(num_factors, lowest_ratio, end_point)
  start = 10
  start += 1 while Primes[start] ** num_factors < end_point
  i = start * 3 * num_factors

  ans, lowest_ratio = inner_find_ratio(num_factors, [],
      i + 1, lowest_ratio, end_point)
  num = ans if ans

  [lowest_ratio, num]
end

def inner_find_ratio(num_factors, fixed_factors,
                     max, lowest_ratio, end_point)
  if num_factors == 0
    new_low = nil
    num = fixed_factors.reduce(:*)
    return [-1, lowest_ratio] if num < 0.75 * end_point

    totient = Totient.of_with_factors(num, fixed_factors)
    if (num / totient.to_f < lowest_ratio) &&
        (totient.to_s.split(//).sort ==
        num.to_s.split(//).sort)
      lowest_ratio = num / totient.to_f
      new_low = num
      puts "#{num} : #{lowest_ratio}"
    end
  elsif max > 10
    max_val = end_point / fixed_factors.reduce(1, :*)
    i = max - 1
    i -= 1 while i > 0 && Primes[i] > max_val

    while true
      factors = fixed_factors + [ Primes[i] ]
      ans, lowest_ratio = inner_find_ratio(num_factors - 1,
        factors, i, lowest_ratio, end_point)
      break if (ans && ans < 0) || i < 5
      new_low = ans if ans
      i -= 1
    end
  end

  [new_low, lowest_ratio]
end

lowest_ratio, answer = find_ratio(2, 20, 10**7)


#i = 10
#lowest_ratio = 20
#while i < end_point
#  totient = Totient.of(i)
#  if i / totient.to_f < lowest_ratio
#    if (totient.to_s.split(//).sort == i.to_s.split(//).sort)
#      lowest_ratio = i / totient.to_f
#      puts "#{i} : #{lowest_ratio}"
#      ans = i
#    end
#  end
#  i += 1
#end

puts "found_num: #{ans}"
puts Totient.of(ans)

#former answer: 9848203
