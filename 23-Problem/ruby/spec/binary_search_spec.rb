require File.dirname( File.expand_path( __FILE__) ) + "/../lib/binary_search.rb"

describe BinarySearch do
  before(:each) do
    @a = [1, 4, 7, 8, 11, 19, 98, 99]
  end
  
  it "should say that each member of the array exists" do
    @a.each{|i| BinarySearch.exists?(@a, i).should be_true }
  end

  it "should say that members that aren't in the array don't exist" do
    [2, 5, 9, 20, 97, 100].each{|i| BinarySearch.exists?(@a, i).should be_false }
  end
  
  
end

