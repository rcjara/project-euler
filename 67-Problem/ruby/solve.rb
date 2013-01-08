require File.dirname( File.expand_path( __FILE__) ) + "/../../18-Problem/ruby/lib/pyramid.rb"

text = File.read(File.dirname( File.expand_path( __FILE__) ) + "/../downloaded/triangle.txt" )

pyr = Pyramid.new(text)
path = pyr.find_ideal_path
ans = pyr.sum_path(path)

puts ans
puts path.length

