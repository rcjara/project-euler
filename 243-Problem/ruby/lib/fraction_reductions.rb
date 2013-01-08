require_relative "../../../shared_ruby/euler.rb"

module FractionReductions
  def self.naive(int)
    (1..int).inject(0) do |sum, i|
      sum + (int.highest_common(i) > 1 ? 1 : 0)
    end
  end

  def self.by_factors(int)
    return 0 if int < 2

    with_uniq_factors(int, Primes.factors(int).uniq)
  end

  def self.with_uniq_factors(int, uniq_factors)
    initial = uniq_factors.inject(0) do |sum, factor|
      sum + (int / factor) - 1
    end

    additional = (2..uniq_factors.length).inject(0) do |sum, combine|
      combined_value = uniq_factors
          .combination(combine).inject(0) do |inner_sum, combination|
        this_comb_val = (int / combination.inject(&:*) ) - 1
        inner_sum + (combine.even? ? -this_comb_val : this_comb_val)
      end
      sum + combined_value
    end

    initial + additional + 1
  end
end
