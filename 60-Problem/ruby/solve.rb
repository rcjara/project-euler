require_relative "../../shared_ruby/euler.rb"

class ConcatenationSolver
  attr_reader :answer

  def initialize(num_elements)
    @num_elements     = num_elements
    @min_size_found   = 30_000
    @answer           = nil
  end

  def concatenates?(i, array)
    num = Primes[i]
    array.each do |j|
      orig = Primes[j]
      return false unless Primes.is_prime?((num.to_s + orig.to_s).to_i)
      return false unless Primes.is_prime?((orig.to_s + num.to_s).to_i)
    end

    true
  end

  def possible_additions(found_primes)
    val = found_primes.reduce{ |s, i| s + Primes[i] }
    i = found_primes[-1] + 1
    possibilities = []
    while val + Primes[i] < @min_size_found
      if concatenates?(i , found_primes)
        possibilities << i
      end
      i += 1
    end

    possibilities
  end

  def find_combos(starting_array)
    if starting_array.length >= @num_elements
      size = starting_array.reduce{ |s, i| s + Primes[i] }
      if size < @min_size_found
        @min_size_found = size
        @answer = starting_array
      end
      return starting_array
    end

    possibilities = possible_additions(starting_array)
    possibilities.collect do |addition|
      find_combos(starting_array + [addition])
    end.reject {|x| x.nil? || x.empty? }
  end
end


solver = ConcatenationSolver.new(5)

1.upto(10).each do |i|
  results = solver.find_combos( [i] )
  results.flatten.each_slice(5) do |array|
    puts array.collect{ |i| Primes[i] }.join(",")
  end
end

puts solver.answer.collect{|i| Primes[i] }.join(", ")
puts solver.answer.collect{|i| Primes[i] }.reduce(:+)
