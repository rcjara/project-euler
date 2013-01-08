require File.dirname( File.expand_path( __FILE__) ) + "/../../3-Problem/ruby/lib/primes.rb"

answer = Primes.below(2_000_000).inject(0) {|sum, pr| sum + pr }
puts answer
