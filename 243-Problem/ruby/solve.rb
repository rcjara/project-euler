require_relative "../../shared_ruby/euler"
require_relative "lib/fraction_reductions"

target_ratio = 15499 / 94744.0
lowest_found = 1.0

puts "target: #{target_ratio}"

range = 1

class PyramidCounter
  def initialize(base)
    @base = base
    @array = [1] * base
    @array[-1] = 1
    @array[0] = 0
  end

  def advance!
    i = 0
    carry = true
    while true
      @array[i] += 1
      if @array[i] > @base - i
        @array[i] = 1
        i += 1
        return false if i >= @base
      else
        break
      end
    end

    true
  end

  def to_a
    @array
  end
end

def ordered_pyramids
  i = 2
  [].tap do |list|
    while i < 10
      counter = PyramidCounter.new(i)
      while counter.advance!
        factors = []
        denominator = counter.to_a.each.with_index.inject(1) do |product, (num, i)|
          factors << Primes[i] if num > 0
          product * Primes[i] ** num
        end

        list << [denominator, factors]
      end

      i += 1
    end
  end.sort_by{ |denominator, factors| denominator }
end

ordered_pyramids.each do |denominator, factors|
  resilient = denominator - FractionReductions.with_uniq_factors(denominator, factors)

  new_ratio = resilient.to_f / (denominator - 1)
  if new_ratio < lowest_found
    puts "#{new_ratio} (#{denominator}) (#{factors.join(", ")})"
    lowest_found = new_ratio
    break if lowest_found < target_ratio
  end
end

