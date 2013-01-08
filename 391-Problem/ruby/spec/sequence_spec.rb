require_relative "../lib/binary_sequence"

describe BinarySequence do
  context "#first" do
    it { subject.first(8).should == [0, 1, 2, 4, 5, 7, 9, 12] }
  end

  context "#take_while" do
    it { subject.take_while {|a| a < 10 }.should == [0, 1, 2, 4, 5, 7, 9] }
  end

end
