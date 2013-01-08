require File.dirname( File.expand_path( __FILE__) ) + "/../3-Problem/ruby/lib/primes.rb"
require File.dirname( File.expand_path( __FILE__) ) + "/../2-Problem/ruby/lib/Fib.rb"
require File.dirname( File.expand_path( __FILE__) ) + "/../23-Problem/ruby/lib/binary_search.rb"
require File.dirname( File.expand_path( __FILE__) ) + "/../42-Problem/ruby/lib/triangles.rb"
require File.dirname( File.expand_path( __FILE__) ) + "/../71-Problem/ruby/lib/fract.rb"

class Numeric
  def highest_common(other)
    a = self
    b = other
    while a > 0 && b > 0
      if a > b
        a -= b
      elsif b > a
        b -= a
      else
        return a
      end
    end
    return a if b == 0
    b
  end

  def palindrome?
    self.to_s.palindrome?
  end

  def reverse
    self.to_s.reverse.to_i
  end

  def sum_of_digits
     mod10 = (self % 10)
     self > 10 ? mod10 + (self / 10).sum_of_digits : mod10
  end

end

class Fixnum
  include Enumerable

  def each_digit
    if !block_given?
      enum_for(:each_digit)
    else
      num = self
      while num > 0
        yield num % 10
        num /= 10
      end
    end
  end

  def rotate_lft
    s = self.to_s
    (s[1..-1] + s[0]).to_i
  end

  def rotate_rgt
    s = self.to_s
    (s[-1] + s[0...-1]).to_i
  end

  def rotations
    [self] + self.other_rotations
  end

  def other_rotations
    s = self.to_s
    (1...s.length).collect do |i|
      (s[i..-1] + s[0...i]).to_i
    end
  end

  def truncate_lft
    self.to_s[1..-1].to_i
  end

  def truncate_rgt
    self / 10
  end

  def fact
    (2..self).inject(1){|s, n| s * n }
  end

  def choose(r)
    self.fact / (r.fact * (self - r).fact)
  end


  ######################################
  # Triangular, Hexagonal , Pentagonal #
  ######################################

  def to_tri
    self * (self + 1) / 2
  end

  def is_tri?
    i = ((-1 + Math.sqrt(1 + 8 * self)) / 2).round
    i.to_tri == self
  end

  def to_square
    self ** 2
  end

  def is_square?
    i = Math.sqrt(self).round
    i.to_square == self
  end

  def to_pent
    (3 * self ** 2 - self) / 2
  end

  def is_pent?
    i = ((1 + Math.sqrt(1 + 24 * self)) / 6).round
    i.to_pent == self
  end

  def to_hex
    2 * self ** 2 - self
  end

  def is_hex?
    i = ((1 + Math.sqrt(1 + 8 * self)) / 4).round
    i.to_hex == self
  end

  def to_hept
    self * (5 * self - 3) / 2
  end

  def to_oct
    self * (3 * self - 2)
  end
end

class Array
  def dot(other_array)
    self.each_with_index.inject(0) do |sum, wi|
      obj = wi[0]
      i   = wi[1]
      obj * other_array[i] + sum
    end
  end
end

class String
  def score
    self.each_char.inject(0){|s, chr| String.score_keys[chr] + s }
  end

  def palindrome?
    return true if length < 2
    return false if self[0] != self[-1]
    self[1...-1].palindrome?
  end

  protected

  def self.construct_score_keys
    score_keys = Hash.new(0)
    ('A'..'Z').each_with_index do |ltr, i|
      score_keys[ltr] = i + 1
    end
    ('a'..'z').each_with_index do |ltr, i|
      score_keys[ltr] = i + 1
    end

    score_keys
  end

  def self.score_keys
    @@score_keys ||= construct_score_keys
  end
end
