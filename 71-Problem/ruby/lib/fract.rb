require File.dirname( File.expand_path( __FILE__) ) + "/../../../shared_ruby/euler.rb"

class Fract
  include Comparable
  attr_reader :num, :den

  def initialize(num, den)
    @num = num
    @den = den
  end

  def to_s
    "#{num}/#{den}"
  end

  def terms
    [@num, @den]
  end

  def +(other)
    this_fract = reduce
    other_fract = if other.class == Fract
      other.reduce
    else
      Fract.new(other, 1)
    end

    Fract.new(this_fract.num * other_fract.den + other_fract.num * this_fract.den, this_fract.den * other_fract.den).reduce
  end

  def reduce
    new_num, new_den = remove_fracts

    loop do
      hcd = new_num.highest_common new_den
      break if hcd == 1
      new_num /= hcd
      new_den /= hcd
    end
    Fract.new(new_num, new_den)
  end

  def remove_fracts
    return [@num, @den] unless @num.class == Fract || @den.class == Fract
    new_num = 1
    new_den = 1

    if @num.class == Fract
      new_num *= @num.num
      new_den *= @num.den
    else
      new_num *= @num
    end

    if @den.class == Fract
      new_num *= @den.den
      new_den *= @den.num
    else
      new_den *= @den
    end
    
    [new_num, new_den]
  end

  def <=>(other)
    (@num * other.den) <=> (@den * other.num)
  end

  
end
