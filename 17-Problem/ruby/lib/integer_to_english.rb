class Fixnum
  def to_english
    self.to_eng.join(" ")
  end

  def to_eng(digit = 0)
    return [] if self == 0

    if digit % 3 == 0
      last_two = self % 100
      beginning = (self / 100).to_eng(digit + 2)
      mid = if last_two > 19
        last_one = last_two % 10
        last_two -= last_one
        last_two.small_digit_conversion + last_one.small_digit_conversion
      elsif last_two > 0
        last_two.small_digit_conversion
      else
        []
      end
      ending = digit.digit_suffix
      the_and = beginning.empty? || mid.empty? ? [] : ["and"]
      beginning + the_and + mid + ending
    elsif digit % 3 == 2
      last_one = self % 10
      ending = last_one > 0 ? last_one.small_digit_conversion + ["hundred"] : []
      (self / 10).to_eng(digit + 1) + ending
    else
      []
    end
  end

  def letter_count
    self.to_eng.inject(0){|s, word| word.length + s }
  end

  protected 

  def digit_suffix
    case self
    when 3
      ["thousand"]
    when 6
      ["million"]
    else
      []
    end
  end

  def small_digit_conversion
    case self
    when 1
      ["one"]
    when 2
      ["two"]
    when 3
      ["three"]
    when 4
      ["four"]
    when 5
      ["five"]
    when 6
      ["six"]
    when 7
      ["seven"]
    when 8
      ["eight"]
    when 9
      ["nine"]
    when 10
      ["ten"]
    when 11
      ["eleven"]
    when 12
      ["twelve"]
    when 13
      ["thirteen"]
    when 14
      ["fourteen"]
    when 15
      ["fifteen"]
    when 16
      ["sixteen"]
    when 17
      ["seventeen"]
    when 18
      ["eighteen"]
    when 19
      ["nineteen"]
    when 20
      ["twenty"]
    when 30
      ["thirty"]
    when 40
      ["forty"]
    when 50
      ["fifty"]
    when 60
      ["sixty"]
    when 70
      ["seventy"]
    when 80
      ["eighty"]
    when 90
      ["ninety"]
    else
      []
    end
  end
end
