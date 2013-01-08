require_relative "../lib/continuer.rb"

describe Continuer do
  before(:each) do
    text = File.read( File.dirname( File.expand_path( __FILE__ ) ) + "/../../periods_to_100.txt")
    @continuations = text.split(/\n/).collect do |line|
      nums = line.split(/,/).collect(&:to_i)
      [nums[0], nums[1], nums[2..-1] ]
    end
  end

  it "should be able to precisely continue under 100" do
    @continuations.each do |array|
      Continuer.precise_continue(array[0]).should == array[1..2]
    end
  end

  it "should be able to precisely continue the sqrt of 23" do
    Continuer.precise_continue(23, 4).should == [4, [1, 3, 1, 8] ]
  end

  it "should be able to precisely continue the sqrt of 2" do
    Continuer.precise_continue(2, 1).should == [1, [2] ]
  end

  it "should be able to precisely continue the sqrt of 3" do
    Continuer.precise_continue(3, 1).should == [1, [1, 2] ]
  end

  it "should be able to precisely continue the sqrt of 5" do
    Continuer.precise_continue(5, 2).should == [2, [4] ]
  end

  it "should be able to precisely continue the sqrt of 6" do
    Continuer.precise_continue(6, 2).should == [2, [2, 4] ]
  end

  it "should be able to continue under 100" do
    @continuations.each do |array|
      Continuer.continue(Math::sqrt(array[0]) ).should == array[1..2]
    end
  end

  it "should be able to continue the sqrt of 23" do
    Continuer.continue(Math.sqrt(23) ).should == [4, [1, 3, 1, 8] ]
  end

  it "should be able to continue the sqrt of 2" do
    Continuer.continue(Math.sqrt(2) ).should == [1, [2] ]
  end

  it "should get the right number of odd periods for 13" do
    Continuer.odd_periods_below(13).should == 4
  end

  it "should get the right number of odd periods for 99" do
    Continuer.odd_periods_below(99).should == 20
  end

end

