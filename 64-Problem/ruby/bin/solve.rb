require_relative "../lib/continuer.rb"

start = Time.now

puts Continuer.odd_periods_below(10_000)


puts Time.now - start
