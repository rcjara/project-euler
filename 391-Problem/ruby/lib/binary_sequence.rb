class BinarySequence < Enumerator
  def initialize
    super do |y|
      i = 0
      total_ones = 0
      loop do
        total_ones += i.to_s(2).each_char.map(&:to_i).inject(&:+)
        y << total_ones
        i += 1
      end
    end
  end
end
