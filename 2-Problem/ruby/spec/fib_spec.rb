require File.dirname( File.expand_path( __FILE__) ) + "/../lib/Fib.rb"

describe Fib do
  describe "under x" do
    it "should get the right answer for under 100" do
      Fib.under(100).should == [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
    end

    it "should pass this caching test" do
      Fib[1000]
      (5...1000).each do |i|
        Fib.under(Fib[i] + 1).length.should == i + 1
      end
    end
  end
  
  describe "first x" do
    it "should get the right answer for first 7" do
      Fib.first(7).should == [1, 1, 2, 3, 5, 8, 13]
    end

    it "should have the right length for a large x" do
      Fib.first(200).length.should == 200
    end

    
  end

  describe "index x" do
    it "should get the right index for a low number" do
      Fib.index(13).should == 6
    end

    it "should get a negative index for a non-existent index" do
      Fib.index(90).should == -10
    end
    
    
    it "should be able to cache a big number, then find the right index for a small number" do
      Fib.first(100)
      Fib.index(89).should == 10
    end
    
  end
end

