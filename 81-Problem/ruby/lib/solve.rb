require File.dirname( File.expand_path( __FILE__) ) + "/../lib/min_path_matrix.rb"

text = File.read(File.dirname( File.expand_path( __FILE__) ) + "/../../downloaded/matrix.txt")

matrix = text.split(/\n/).collect{|line| line.split(/,/).collect(&:to_i) }

solver = MinPathMatrix.new(matrix)

ans = solver.min_sum

puts ans
