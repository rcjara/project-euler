require File.dirname( File.expand_path( __FILE__) ) + "/../lib/amicable.rb"

describe Amicable do
  it "should return an amicable number's pair" do
   Amicable.pair(220).should == 284
  end
  
  it "should return nil for a non-amicable number" do
    Amicable.pair(10).should == nil
  end

end

describe Divisors do
  it "should get the right divisors" do
    Divisors.divisors(8).sort.should == [1, 2, 4, 8]
  end

  it "should get the right sum for divisors" do
    Divisors.sum_divisors(8).should == 15
  end
  
  it "should get the right divisors for a bigger number" do
    Divisors.divisors(220, true).sort.should == [1, 2, 4, 5, 10, 11, 20, 22, 44, 55, 110]
    Divisors.divisors(284, true).sort.should == [1, 2, 4, 71, 142]
  end
  
  
end


