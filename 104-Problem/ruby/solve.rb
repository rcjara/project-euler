require_relative "../../shared_ruby/euler.rb"

FIRST_LEN = 20

def pan_digit?(string)
  string.split(//).sort == ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
end

def first_and_last_parts(num)
  string = num.to_s
  [string[0...FIRST_LEN].to_i, string[-9..-1].to_i ]
end

def calc_first_part(lesser, lesser_length, greater, greater_length)
  mult = greater_length > lesser_length ? 10 : 1
  new_string = (lesser / mult + greater).to_s
  #new_string = new_string[0...-1] if mult == 10
  if new_string.length > FIRST_LEN
    [ new_string[0...FIRST_LEN].to_i, greater_length + 1]
  else
    [new_string.to_i, greater_length]
  end
end

def calc_second_part(lesser, greater)
  (lesser + greater) % 1_000_000_000
end

i = 2729
i = 500
first_1, last_1 = first_and_last_parts(Fib[i] )
first_1_len = Fib[i].to_s.length
i += 1
first_2, last_2 = first_and_last_parts(Fib[i] )
first_2_len = Fib[i].to_s.length

loop do
  i += 1
  puts i + 1 if i % 1000 == 999

  first_new, first_new_len = calc_first_part(first_1, first_1_len, first_2, first_2_len)
  last_new = calc_second_part(last_1, last_2)

  break if pan_digit?(last_new.to_s) && pan_digit?(first_new.to_s[0...9])

  first_1, first_1_len = first_2, first_2_len
  first_2, first_2_len = first_new, first_new_len

  last_1 = last_2
  last_2 = last_new

end

puts i + 1
