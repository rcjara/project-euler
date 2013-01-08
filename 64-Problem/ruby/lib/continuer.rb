require_relative "../../../shared_ruby/euler.rb"
class Continuer

  def self.odd_periods_below(num)
    odd_periods = 0
    i = 2
    current_square = 4
    current_sqrt   = 2
    prev_square    = 1
    while i <= num
      if i == current_square
        current_sqrt  += 1
        prev_square    = current_sqrt - 1
        current_square = current_sqrt ** 2
      else
        head, t_period = precise_continue( i, prev_square )
        odd_periods += 1 if t_period.length % 2 == 1
      end

      i += 1
    end

    odd_periods
  end

  def self.precise_continue(sqrt, lowest_sq = nil)
    lowest_sq ||= calc_square(sqrt)

    sqrt_val = Math::sqrt(sqrt)
    initial = lowest_sq
    rest = precise_period(sqrt, sqrt_val, 1, -initial)
    [initial, rest]
  end

  def self.precise_period(sqrt, sqrt_val, num, den, sqrt_mult = 1, accum = [], show = false)
    #
    #             num                √sqrt + num * den
    #  -----------------------  = ---------------------------
    #  sqrt_mult * √sqrt - den    sqrt_mult * sqrt - den ** 2
    #

#    puts <<EOS
#     #{num}
#---------------
#  #{sqrt_mult}v/#{sqrt} + #{den}
#
#EOS

    new_sqrt_mult = num
    num *= -den

    #remove the sqrt from the denom
    den = sqrt_mult * sqrt - (den ** 2)

    sqrt_mult = new_sqrt_mult

    multiplier = sqrt_mult.highest_common(num)
    sqrt_mult /= multiplier
    num /= multiplier

    hcd = multiplier.highest_common(den)

    den /= hcd
    multiplier /= hcd

    num *= multiplier
    sqrt_mult *= multiplier

#    puts <<EOS
##{sqrt_mult}v/#{sqrt} + #{num}
#---------------
#     #{den}
#
#EOS

    next_digit = ( (sqrt_mult * sqrt_val + num) / den).floor
    return accum + [next_digit] if den == 1

    num -= den * next_digit

#    puts <<EOS
#       #{sqrt_mult}v/#{sqrt} + #{num}
##{next_digit} +  ---------------
#        #{den}
#
#EOS

    precise_period(sqrt, sqrt_val, den, num, sqrt_mult, accum + [next_digit])
  end

  def self.calc_square(max)
    i = 0
    i += 1 while i ** 2 < max
    i - 1
  end

  def self.continue(num)
    begin
      initial = num.floor
      remainder = num - num.floor
      rest = period(remainder)
      [initial, rest]
    rescue Exception => e
      puts "Continue - Num: #{num}, initial: #{initial}, remainder: #{remainder}"
      throw e
    end
  end

  def self.period(remainder, accum = [] )
    begin
      num = 1.0 / remainder
      value = num.floor
      remainder = (num - value)
      num_remainder_pair = [ value, remainder.round(2) ]
      return only_values(accum) if accum.include?(num_remainder_pair)
      period(remainder, accum << num_remainder_pair)
    rescue Exception => e
      puts "Period - Num: #{num}, value: #{value}, remainder: #{remainder}"
      throw e
    end
  end

  def self.present?(comp_pair, accum)
    comp_pair == accum[0]
  end

  def self.only_values(accum)
    accum.collect{ |num_remainder_pair| num_remainder_pair[0] }
  end
end
