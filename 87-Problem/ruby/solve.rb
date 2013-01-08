require_relative "../../shared_ruby/euler.rb"

scnd = thrd = frth = 0

found = {}

UPPER_LIMIT = 50_000_000

def calc_total(second, third, fourth)
  Primes[second] ** 2 + Primes[third] ** 3 + Primes[fourth] ** 4
end

loop do
  thrd = 0
  loop do
    scnd = 0
    total = calc_total(scnd, thrd, frth)
    while total < UPPER_LIMIT
      found[calc_total(scnd, thrd, frth)] = true
      scnd += 1
      total = calc_total(scnd, thrd, frth)
    end
    break if scnd == 0
    thrd += 1
  end
  break if scnd == 0 && thrd == 0
  frth += 1
end

puts found.length
