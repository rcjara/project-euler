require_relative "binary_sequence"

class SkippingGame
  attr_reader :board_state, :game_counter

  def initialize(max_move)
    @max_move = max_move
    @game_counter = 0

    prev = 0
    @board_state = BinarySequence.new.take_while do |new_num|
      keep_going = new_num - prev <= @max_move
      prev = new_num
      keep_going
    end
  end

  def sequence_value(offset = nil)
    return @board_state[@game_counter + offset] if offset
    @board_state[@game_counter]
  end

  def move_by(move)
    raise ZeroMoveError if move == 0
    if sequence_value(move) - sequence_value > @max_move
      raise MoveTooLargeError
    end
    @game_counter += move
  end

  def num_moves_can_reach_index(index)
    counter = 1
    counter += 1 while sequence_value - sequence_value(-counter) <= @max_move
    counter - 1
  end

  class ZeroMoveError < Exception; end
  class MoveTooLargeError < Exception; end
end
