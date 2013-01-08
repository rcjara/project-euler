require_relative "../../../shared_ruby/euler.rb"

class Totient
  def self.of(num)
    factors = Primes.uniq_factors(num)
    of_with_factors(num, factors)
  end

  def self.of_with_factors(num, factors)
    return num - 1 if factors[0] == num
    factors.inject(num) do |prod, factor|
      prod * (factor - 1) / factor
    end
  end
end
