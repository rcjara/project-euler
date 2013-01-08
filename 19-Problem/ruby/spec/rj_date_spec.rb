require File.dirname( File.expand_path( __FILE__) ) + "/../lib/rj_date.rb"
describe RJDate do
  it "should have the right day of the week for Jan 1st, 1901" do
    RJDate.day_of_week(1, 1, 1901).should == 2
  end

  it "should have the right day of the week for Jan 4th 2011" do
    RJDate.day_of_week(1, 5, 2011).should == 3
  end
  
  it "should know what a leap year is" do
    RJDate.leap(1900).should == 28
    RJDate.leap(1901).should == 28
    RJDate.leap(1904).should == 29
    RJDate.leap(2000).should == 29
  end

  it "should get following days right" do
    RJDate.following_day(1, 1, 1900).should == [1, 2, 1900]
    RJDate.following_day(12, 31, 1999).should == [1, 1, 2000]
  end
  
  
  
end

