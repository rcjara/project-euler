require File.dirname( File.expand_path( __FILE__) ) + "/../lib/fract.rb"

describe Fract do
  it "should reduce" do
    @fract = Fract.new(4, 10)
    @fract.should == Fract.new(2, 5)
    @fract.terms.should == [4, 10]
    @fract.reduce.terms.should == [2, 5]
  end

  it "should handle inequalities" do
    Fract.new(4, 10).should be > Fract.new(1, 5)
    Fract.new(1, 5).should be < Fract.new(4, 10)
  end

  
  
end

