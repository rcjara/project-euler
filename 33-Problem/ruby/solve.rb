require File.dirname( File.expand_path( __FILE__) ) + "/../../shared_ruby/euler.rb"

fracts = []

(11..98).each do |numer|
  ((numer + 1)..99).each do |denom|
    next if numer % 10 == 0 || denom % 10 == 0

    first_dig_num = numer % 10
    scnd_dig_num = (numer - first_dig_num) / 10

    first_dig_den = denom % 10
    scnd_dig_den = (denom - first_dig_den) / 10

    next unless first_dig_den == scnd_dig_num || first_dig_num == scnd_dig_den

    first_cancel = first_dig_num.to_f / scnd_dig_den.to_f
    scnd_cancel = scnd_dig_num.to_f / first_dig_den.to_f
    actual_div = numer.to_f / denom.to_f
    if first_cancel == actual_div || scnd_cancel == actual_div
      fracts << [numer, denom]
    end
  end
end

puts fracts.collect{|f| "#{f[0]}/#{f[1]}"}.join("\n")
raise "#{fracts.length} fracts found" unless fracts.length == 4

top = fracts.inject(1){|p, f| p * f[0]}
bottom = fracts.inject(1){|p, f| p * f[1]}

t_f = Primes.factorization(top)
b_f = Primes.factorization(bottom)

primes_in_common = []
t_f.each do |pr|
  if b_f.index(pr)
    b_f.slice!(b_f.index(pr))
    primes_in_common << pr
  end
end

primes_in_common.each{|pr| bottom /= pr }

puts bottom
