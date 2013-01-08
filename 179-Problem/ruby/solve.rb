MAX = 10 ** 7

array = [1] * (MAX + 1)
i = 2
while i <= MAX
  j = i
  while j <= MAX
    array[j] += 1
    j += i
  end
  i += 1
end

ans = 0
i = 1
while i < MAX
  ans += 1 if array[i] == array[i + 1]
  i += 1
end

puts ans
