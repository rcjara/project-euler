require File.dirname( File.expand_path( __FILE__) ) + "/../euler.rb"

describe Fixnum do
  describe "digit rotation" do
    describe "left digit rotation" do
      it "should rotate a single digit number" do
        1.rotate_lft.should == 1
      end
      
      it "should rotate a four digit number" do
        1234.rotate_lft.should == 2341
      end
    end

    describe "right digit rotation" do
      it "should rotate a single digit number" do
        1.rotate_rgt.should == 1
      end
      
      it "should rotate a four digit number" do
        1234.rotate_rgt.should == 4123
      end
    end

    describe "rotations" do
      it "should handle a signle digit number" do
        1.rotations.should == [1]
      end
      
      it "should handle a four digit number" do
        1234.rotations.should == [1234, 2341, 3412, 4123]
      end

      it "should handle 101" do
        101.rotations.should == [101, 11, 110]
      end
      
      
    end
    
  end
  
  
  describe "left truncation" do
    it "should be able to handle two digit numbers" do
      12.truncate_lft.should == 2
    end
    
    it "should be able to handle four digit numbers" do
      1234.truncate_lft.should == 234
    end
  end

  describe "right truncation" do
    it "should be able to handle two digit numbers" do
      12.truncate_rgt.should == 1
    end
    
    it "should be able to handle four digit numbers" do
      1234.truncate_rgt.should == 123
    end
  end

  describe "triangular" do
    it "should say a triangular number is" do
      40755.is_tri?.should be_true
    end

    it "should say a non triangular number isn't" do
      40756.is_tri?.should be_false
    end

    it "should make a number triangular" do
      10.to_tri.should == 55
    end
  end

  describe "pentagonal" do
    it "should say a pentagonal number is" do
      40755.is_pent?.should be_true
    end

    it "should say a non pentagonal number isn't" do
      40756.is_pent?.should be_false
    end

    it "should make a number pentagonal" do
      165.to_pent.should == 40755
    end
  end
  
  describe "hexagonal" do
    it "should say a hexagonal number is" do
      40755.is_hex?.should be_true
    end

    it "should say a non hexagonal number isn't" do
      40756.is_hex?.should be_false
    end

    it "should make a number hexagonal" do
      143.to_hex.should == 40755
    end
  end

  describe "each_digit" do
    it "should work" do
      12345.each_digit.to_a.reverse.join.should == "12345"
    end

    it "should inject" do
      12345.each_digit.inject(0){|s, n| s + n}.should == 15
    end
    
    it "should create a string" do
      string = ""
      12345.each_digit{|n| string << n.to_s }
      string.should == "54321"
    end
    
    
  end
  
  
  
end

