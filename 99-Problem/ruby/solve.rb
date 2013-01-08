def exp_pair_comp(frst, scnd)
  display_exp_pair([frst, scnd])

  big_base, small_base, swap = if frst[0] > scnd[0]
    [frst, scnd, 1]
  else
    [scnd, frst, -1]
  end

  if big_base[0] == small_base[0]
    if big_base[0] > 1
      return swap * big_base[1] <=> small_base[1]
    elsif big_base[0] < 1
      return swap * small_base[1] <=> big_base[1]
    else
      return 0
    end
  else
    if big_base[1] > small_base[1]
      return swap * 1
    elsif big_base[1] == 0 && small_base[1] == 0
      return 0
    elsif big_base[1] == 0
      return swap * -1
    end
  end

  if big_base[1] == small_base[1]
    return swap * big_base[0] <=> 1
  end
  
  # a^2 * b^2 = ab^2; big_base_1 = a^2, b = small_base[0]
  # i know that the big_base number has the smaller exponent
  while big_base[0] > small_base[0]
    big_base[0] /= small_base[0].to_f
    small_base[1] -= big_base[1]
  end
  swap * exp_pair_comp(big_base, small_base)
end

def display_exp(exp)
  "#{exp[0]}^#{exp[1]}"
end

def display_exp_pair(pair)
  puts pair.collect{|exp| display_exp(exp) }.join("   ")
end


pairs = File.read(File.dirname( File.expand_path( __FILE__) ) + "/../downloaded/base_exp.txt").split(/\n/)

highest_index = 0
pairs.each_with_index do |pair, i|
  first_exp = pair.split(/,/).collect(&:to_f)
  scnd_exp = pairs[highest_index].split(/,/).collect(&:to_f)
  highest_index = i if exp_pair_comp(first_exp, scnd_exp) == 1
end

puts highest_index + 1
