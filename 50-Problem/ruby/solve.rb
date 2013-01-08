require File.dirname( File.expand_path( __FILE__) ) + "/../../shared_ruby/euler.rb"
prime = 0
max_seq = 0

MAX_NUM = 1_000_000
Primes.below(MAX_NUM).each_with_index do |pr, i|
  seq = 0
  total_pr = pr
  local_max_pr = pr
  local_max_seq = seq
  while total_pr < MAX_NUM
    if Primes.is_prime?(total_pr)
      local_max_pr = total_pr 
      local_max_seq = seq
    end
    seq += 1
    total_pr += Primes[seq + i]
  end
  if local_max_seq > max_seq
    prime = local_max_pr
    max_seq = local_max_seq
  end
end

puts "#{prime} (#{max_seq + 1})"
