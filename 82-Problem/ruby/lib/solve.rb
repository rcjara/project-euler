require_relative "../lib/matrix_traverser.rb"

matrix_text = File.read( File.dirname( File.expand_path( __FILE__ ) ) + "/../../downloaded/matrix.txt" )

matrix = matrix_text.split(/\n/).collect{ |row| row.split(/,/).collect{|item| item.to_i } }

raise "row length error" unless matrix.length == 80
raise "col length error" unless matrix[0].length == 80

#matrix = matrix[0..15].collect { |row| row[0..15] }

travers = MatrixTraverser.new(matrix)
puts travers.min_path_sum

#travers.print_orig_matrix
#puts "\n\n"
#travers.print_cur_matrix
#
