def bouncy?(num_as_string)
  array = num_as_string.split(//).collect(&:to_i)
  direction = nil
  last = array[0]
  array[1..-1].each_with_index do |current, digit|
    unless current == last
      if direction.nil?
        direction = current > last
      else
        return [true, digit, direction, current] unless (direction && current > last) || (!direction && last > current)
      end
    end
    last = current
  end
  [false, array.length - 2, direction, array[-1]]
end


bouncy = 0
i = 1
prop_num = 99
prop_den = 100

while true

  num_as_string = i.to_s
  length = num_as_string.length
  is_bouncy, digit, direction, current = bouncy?(num_as_string)
  if is_bouncy
    #increase = 10 ** ((length - 2) - digit)
    #puts "#{bouncy} / #{i} bounce += #{increase} (#{bouncy / i.to_f})"
    increase = 1
    bouncy += increase
  else
    increase = 1
    #increase = direction ? (10 - current) : 1
  end

  break if bouncy * prop_den >= i * prop_num
  i += increase
end

bounce_ans = bouncy
ans = i

#until i * (prop_num - 2) >= bouncy * prop_den
#  if i * prop_num == bouncy * prop_den
#    ans = i 
#    bounce_ans = bouncy 
#  end
#  puts bouncy / i.to_f
#  bouncy -= 1 if bouncy?(i.to_s)[0]
#  i -= 1
#end


puts "#{bounce_ans} / #{ans}"


#(9990..10201).each do |x|
#  is_bouncy, digit, direction, current = bouncy?(x.to_s)
#  puts "#{x} #{is_bouncy ? "bouncy" : "not"} #{10 ** ((x.to_s.length - 2) - digit)}"
#end



