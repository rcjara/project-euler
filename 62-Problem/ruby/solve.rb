require File.dirname( File.expand_path( __FILE__) ) + "/../../shared_ruby/euler.rb"

cubes = Hash.new
n = 10

while true
  num = n ** 3
  digits = num.each_digit.to_a.sort
  if cubes[digits]
    cubes[digits] << num
    if cubes[digits].length == 5
      ans = cubes[digits]
      break
    end
  else
    cubes[digits] = [num]
  end
  n += 1
end


puts ans.join(", ")
