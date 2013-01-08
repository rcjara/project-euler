require_relative "../euler.rb"

describe "Array" do
  it "should get a dot product right" do
    [1, 2, 3, 4].dot([3, 4, 5, 6]).should == 50
  end

  it "should get another dot product right" do
    [1, 3, -5].dot([4, -2, -1]).should == 3
  end

end

