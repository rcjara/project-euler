class RomanNumeral
  include Comparable

  CONVERSIONS = {
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000
  }

  ALT_CONVERSIONS = {
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I"
  }

  def initialize(string)
    @string = string.upcase
  end

  def to_s
    @string
  end

  def to_i
    return 0 if @string.nil? || @string.empty?
    if @string.length == 1
      single_digit_to_i @string
    else
      multiple_digit_to_i
    end
  end

  def to_f
    to_i.to_f
  end

  def compress!
    @string = self.class.int_to_str( self.to_i )
    self
  end

  def length
    @string.length
  end

  def <=>(other)
    self.to_i <=> other.to_i
  end

  def self.from_i(original_num)
    RomanNumeral.new( int_to_str(original_num) )
  end

  def self.int_to_str(original_num)
    "".tap do |str|
      ALT_CONVERSIONS.each do |num, char|
        while original_num >= num
          original_num -= num
          str << char
        end
      end
    end
  end


  private

  def single_digit_to_i(str)
    CONVERSIONS.fetch(str, 0)
  end

  def multiple_digit_to_i
    first_digit  = single_digit_to_i(@string[0, 1])
    second_digit = single_digit_to_i(@string[1, 1])
    if first_digit < second_digit &&
        second_digit.to_f / first_digit.to_f <= 10
      second_digit.to_i - first_digit.to_i +
          RomanNumeral.new(@string[2..-1]).to_i
    else
      first_digit + RomanNumeral.new(@string[1..-1]).to_i
    end
  end
end


