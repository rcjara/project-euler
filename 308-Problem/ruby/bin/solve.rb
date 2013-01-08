require File.dirname( File.expand_path( __FILE__) ) + "/../../../shared_ruby/euler.rb"
require File.dirname( File.expand_path( __FILE__) ) + "/../lib/fractran.rb"


program = [[17, 91], [78, 85], [19, 51], 
           [23, 38], [29, 33], [77, 29], 
           [95, 23], [77, 19], [1, 17], 
           [11, 13], [13, 11], [15, 2], 
           [1, 7], [55, 1]]

frac = Fractran.new(2, program)

p = []

#while p.length < 100
#  pr = Primes[p.length]
#  desired_state = 2 ** pr
#  nil until frac.advance_state == desired_state
#  p << frac.states.length
#  if p.length > 1
#    prime_dif = pr - Primes[p.length - 2]
#    steps_dif = p[-1] - p[-2]
#    puts "#{pr} (#{steps_dif}, #{prime_dif}) #{steps_dif / pr}, #{steps_dif % pr}"
#    #puts "#{frac.present_state} (#{frac.states[-2]})"
#  end
#end

1000.times{ puts frac.advance_state }
