require File.dirname( File.expand_path( __FILE__) ) + "/../../shared_ruby/euler.rb"

i = 144
i += 1 until i.to_hex.is_tri? && i.to_hex.is_pent?

puts i.to_hex
