require File.dirname( File.expand_path( __FILE__) ) + "/../lib/pyth_trip.rb"

describe PythTrip do
  it "should say that 3 4 5 is a triplet" do
    PythTrip.is_trip?(3, 4, 5).should be_true
  end

  it "should say that 4 3 5 is not a triplet" do
    PythTrip.is_trip?(4, 3, 5).should be_false
  end
  
  it "should say that 3 4 6 is not a triplet" do
    PythTrip.is_trip?(3, 4, 6).should be_false
  end
  
  describe "given a, c" do
    it "should find the third number if it exists" do
      PythTrip.given_a_c(3, 5).should == 4
    end

    it "should return nil if the triplet cannot be made" do
      PythTrip.given_a_c(3, 6).should == nil
    end
  end

  describe "given b, c" do
    it "should find the third number if it exists" do
      PythTrip.given_b_c(4, 5).should == 3
    end

    it "should return nil if the triplet cannot be made" do
      PythTrip.given_b_c(3, 5).should == nil
    end
  end
  
  describe "given two numbers" do
    it "should find the third number if it exists" do
      PythTrip.find_third(5, 3).should == 4
      PythTrip.find_third(5, 4).should == 3
    end
    
    it "should return nil if a triplet cannot be made" do
      PythTrip.find_third(6, 5).should == nil
      PythTrip.find_third(5, 1).should == nil
    end
  end

  describe "given just one number" do
    it "should find the other two if a triplet can be formed" do
      PythTrip.find_rest(5).should == [3, 4]
    end

    it "should return nil if no triplet is possible" do
      PythTrip.find_rest(3).should == nil
    end
    
    
  end
  
  
end

