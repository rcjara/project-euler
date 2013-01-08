require File.dirname( File.expand_path( __FILE__) ) + "/../lib/triangles.rb"
describe Triangles do
  it "should get the right triangles below 60" do
    Triangles.below(60).should == [1, 3, 6, 10, 15, 21, 28, 36, 45, 55]
  end

  it "should be able to access the 20th triangle number" do
    Triangles[20].should == 210
  end

  it "should be able to say that 55 is a triangle number" do
    Triangles.is?(55).should be_true
  end
  
  it "should say that 56 is not a triangle number" do
    Triangles.is?(56).should be_false
  end

  it "should be able to say the 66 is a triangle number" do
    Triangles.is?(66).should be_true
  end
  
  it "should be able to say that 12 is not a triangle number" do
    Triangles.is?(12).should be_false
  end
  
end

