require File.dirname( File.expand_path( __FILE__) ) + "/../../../shared_ruby/euler.rb"
class Fractran
  attr_reader :states, :program, :two_indices

  def initialize(seed_state = 2, program = [[17, 91], [78, 85], [19, 51], 
                                            [23, 38], [29, 33], [77, 29], 
                                            [95, 23], [77, 19], [1, 17], 
                                            [11, 13], [13, 11], [15, 2], 
                                            [1, 7], [55, 1]])
    @states = [seed_state]
    @program = program
  end

  def compute_two_rule
    @two_indices = []
    @program.each_with_index do |fract, i|
      @two_indices << i if fract[1] % 2 == 0
    end
  end

  def present_state
    @states[-1]
  end

  def valid_fraction?(i)
   (present_state * @program[i][0]) % @program[i][1] == 0 
  end

  def advance_state
    i = 0
    i += 1 until valid_fraction?(i) 
    @states << present_state * @program[i][0] / @program[i][1]
    present_state
  end
end
