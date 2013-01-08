require File.dirname( File.expand_path( __FILE__) ) + "/../lib/integer_to_english.rb"

describe "int.to_english" do
  it "should handle a one digit thing" do
    1.to_english.should == "one"
    9.to_english.should == "nine"
  end

  it "should handle a teen" do
    13.to_english.should == "thirteen"
  end

  it "should get the right answer for multiples of ten" do
    20.to_english.should == "twenty"
    30.to_english.should == "thirty"
  end
  
  it "should handle several two digit numbers" do
    21.to_english.should == "twenty one"
    45.to_english.should == "forty five"
    63.to_english.should == "sixty three"
  end

  it "should handle one hundred" do
    100.to_english.should == "one hundred"
    800.to_english.should == "eight hundred"
  end
  

  it "should handle several three digit numbers" do
    215.to_english.should == "two hundred and fifteen"
    342.to_english.should == "three hundred and forty two"
    498.to_english.should == "four hundred and ninety eight"
    999.to_english.should == "nine hundred and ninety nine"
  end
  
  it "should get the to_eng part right too" do
    342.to_eng.should == ["three", "hundred", "and", "forty","two"]
  end
  
  it "should handle one thousand" do
    1000.to_english.should == "one thousand"
  end
  
end

describe "letter count" do
  it "should have the right letter count" do
    342.letter_count.should == 23
    115.letter_count.should == 20
  end
  
end


