require File.dirname( File.expand_path( __FILE__) ) + "/../../2-Problem/ruby/lib/Fib.rb"

i = 0
i += 1 until Fib[i].to_s.length == 1000

puts "#{i + 1} (#{Fib[i]})"
