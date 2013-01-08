require File.dirname( File.expand_path( __FILE__) ) + "/../lib/poker_hand.rb"

describe PokerHand do
  before(:each) do
    @hands = [["2H","3D","4S","5C","KD"],
              ["2H","3D","4S","5C","AD"],
              ["2H","2D","4S","5C","QD"],
              ["2H","3D","4S","2C","KD"],
              ["2H","4D","4S","3C","10D"],
              ["2H","2D","4S","JC","4D"],
              ["2H","4D","4S","2C","AD"],
              ["2H","3D","3S","3C","AD"],
              ["2H","3D","4S","5C","6D"],
              ["3H","4D","6S","5C","7D"],
              ["10H","JH","QH","KC","AD"],
              ["2D","3D","4D","5D","AD"],
              ["2H","2D","2S","5C","5D"],
              ["2H","2D","2S","2C","AD"],
              ["2H","3H","4H","5H","6H"]]
  end

  it "should show a flush when there is one" do
    hand = PokerHand.new(["2D","3D","4D","5D","AD"])
    hand.flush.should be_true
  end

  it "should not show a flush when the isn't one" do
    hand = PokerHand.new(["2S","3D","4D","5D","AD"])
    hand.flush.should be_false
  end

  it "should show a straight when there is one" do
    hand = PokerHand.new(["10H","JH","QH","KC","AD"])
    hand.straight.should be_true
  end

  it "should not show a straight when there isn't one" do
    hand = PokerHand.new(["10H","JH","QH","QC","AD"])
    hand.straight.should be_false
  end

  it "should handle greater than correctly" do
    @hands.each_cons(2) do |a, b|
      hand_a = PokerHand.new(a)
      hand_b = PokerHand.new(b)
      hand_b.should be > hand_a
      hand_a.should be < hand_b
    end
  end

  it "test about should be > than" do
    1.should be < 3
    3.should be > 1
  end
  
  
  
end

