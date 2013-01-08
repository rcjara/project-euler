require File.dirname( File.expand_path( __FILE__) ) + "/../lib/fractran.rb"

def first_hundred_seq
  [2, 15, 825, 725, 1925, 2275,
  425, 390, 330, 290, 770, 910,
  170, 156, 132, 116, 308, 364,
  68, 4, 30, 225, 12375, 10875,
  28875, 25375, 67375, 79625, 14875, 13650,
  2550, 2340, 1980, 1740, 4620, 4060,
  10780, 12740, 2380, 2184, 408, 152,
  92, 380, 230, 950, 575, 2375,
  9625, 11375, 2125, 1950, 1650, 1450,
  3850, 4550, 850, 780, 660, 580,
  1540, 1820, 340, 312, 264, 232,
  616, 728, 136, 8, 60, 450,
  3375, 185625, 163125, 433125, 380625, 1010625,
  888125, 2358125, 2786875, 520625, 477750, 89250,
  81900, 15300, 14040, 11880, 10440, 27720,
  24360, 64680, 56840, 150920, 178360, 33320,
  30576, 5712, 2128, 1288, 5320]
end

describe Fractran do
  before(:each) do
    @program = [[17, 91], [78, 85], [19, 51], 
                             [23, 38], [29, 33], [77, 29], 
                             [95, 23], [77, 19], [1, 17], 
                             [11, 13], [13, 11], [15, 2], 
                             [1, 7], [55, 1]]
    @frac = Fractran.new(2, @program)
  end

  it "should have the correct program" do
    @frac.program.should == @program
  end

  
  it "should get the correct next state" do
    @frac.advance_state.should == 15
  end
  
  it "should get the correct several " do
    6.times { @frac.advance_state }
    @frac.states.should == [2, 15, 825, 725, 1925, 2275, 425]
  end
  
  it "should get the proper first one hundred sequence" do
    100.times {@frac.advance_state }
    @frac.states.should == first_hundred_seq
  end
end
