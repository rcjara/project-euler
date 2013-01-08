require_relative "../lib/skipping_game"

describe SkippingGame do
  context "a game of size two" do
    subject { SkippingGame.new(2) }

    it { subject.game_counter.should == 0 }
    it { subject.board_state.should == [0, 1, 2, 4, 5, 7, 9] }

    it "should have a last state of 9" do
      subject.board_state.last.should == 9
    end

    it "should reject an increment above its max_move" do
      expect { subject.move_by(3) }.to raise_error(SkippingGame::MoveTooLargeError)
    end

    it "should reject a zero move" do
      expect { subject.move_by(0) }.to raise_error(SkippingGame::ZeroMoveError)
    end

    it "should give the right sequence value after moving 3 times" do
      5.times{ subject.move_by(1) }
      subject.sequence_value.should == 7
    end


    it "should increment the game counter with a legal move" do
      subject.move_by(2)
      subject.game_counter.should == 2
    end

    context "reachable_from" do
      it { subject.num_moves_can_reach_index(5).should == 1 }
    end

  end

  context "a game of size seven" do
    subject { SkippingGame.new(7) }

    it { subject.num_moves_can_reach_index(5).should == 5 }
  end


end
