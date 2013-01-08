require_relative "../lib/roman_numeral.rb"

describe RomanNumeral do
  context "I" do
    subject { RomanNumeral.new "I" }

    it { subject.to_i.should == 1 }
    it { should be < RomanNumeral.new("V") }
  end

  context "V" do
    subject { RomanNumeral.new "V" }

    it { subject.to_i.should == 5 }
  end

  context "X" do
    subject { RomanNumeral.new "X" }

    it { subject.to_i.should == 10 }
  end

  context "L" do
    subject { RomanNumeral.new "L" }

    it { subject.to_i.should == 50 }
    it { should be > RomanNumeral.new("X") }
  end

  context "C" do
    subject { RomanNumeral.new "C" }

    it { subject.to_i.should == 100 }
  end

  context "D" do
    subject { RomanNumeral.new "D" }

    it { subject.to_i.should == 500 }
  end

  context "M" do
    subject { RomanNumeral.new "M" }

    it { subject.to_i.should == 1000 }
  end

  context "ix" do
    subject { RomanNumeral.new "ix" }

    it { subject.to_i.should == 9 }
  end

  context "xix" do
    subject { RomanNumeral.new "xix" }

    it { subject.to_i.should == 19 }
  end

  context "MMMMDXCV" do
    subject { RomanNumeral.new "MMMMDXCV" }

    it { subject.to_i.should == 4595 }
  end

  context "#from_i" do
    subject { RomanNumeral.from_i 4595 }
    it { subject.to_s.should == "MMMMDXCV" }
  end
end

# I = 1
# V = 5
# X = 10
# L = 50
# C = 100
# D = 500
# M = 1000
