require File.dirname( File.expand_path( __FILE__) ) + "/../lib/pyramid.rb"

STR = <<EOS
      75
    95  64
  17  47  82
18  35  87  10
EOS

describe Pyramid do
  before(:each) do
    @pyr = Pyramid.new(STR)
  end

  it "should have the right array" do
    @pyr.to_a.should == [[75],
                         [95, 64],
                         [17, 47, 82],
                         [18, 35, 87, 10]]
  end

  it "should get the right path upon traversing" do
    @pyr.traverse([1, 0, 1]).should == [75, 64, 47, 87]
  end
  
  it "should get the right sum upon traversing" do
    @pyr.sum_path([1, 0, 1]).should == 75 + 64 + 47 + 87
  end

  it "should have the right base level ideals" do
    @pyr.base_level_ideals.should == [
      [52, [1]],
      [134, [1]],
      [169, [0]] ]
  end

  it "should have the right ideal from level below" do
    @pyr.ideal_from_level_below(1, @pyr.base_level_ideals).should == [ [134 + 95, [1, 1] ],
                [64 + 169, [1, 0] ] ]
  end

  it "should get the right number of steps for the ideal path" do
    @pyr.find_ideal_path.length.should == 3
  end
  
  it "should get the right ideal path" do
    @pyr.find_ideal_path.should == [1, 1, 0]
  end
  
end

