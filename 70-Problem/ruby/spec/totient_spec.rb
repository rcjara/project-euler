require_relative "../lib/totient.rb"

describe Totient do
  it "should get the right answers for the first several terms" do

    [1,1,2,2,4,2,6,4,6,
    4,10,4,12,6,8,8,16,6,18,
    8,12,10,22,8,20,12,18,12,28,
    8,30,16,20,16,24,12,36,18,24,
    16,40,12,42,20,24,22,46,16,42,
    20,32,24,52,18,40,24,36,28,58,
    16,60,30,36,32,48,20,66,32,44,
    24,70,24,72,36,40,36,60,24,78,
    32,54,40,82,24,64,42,56,40,88,
    24,72,44,60,46,72,32,96,42,60].each.with_index do |num, i|
      Totient.of(i + 1).should == num
    end
  end

  it "should get the right answer for 8" do
    Totient.of(8).should == 4
  end

  it "should get the right answer for 10" do
    Totient.of(10).should == 4
  end

  it "should get the right answer for 12" do
    Totient.of(12).should == 4
  end


  it "should get the right answer for a later term" do
    Totient.of(87109).should == 79180
  end

end



