require File.dirname( File.expand_path( __FILE__) ) + "/../lib/three_n_sequence.rb"
describe ThreeNSequence do
  it "should get the right answer for 13 and a derivative of 13" do
    ThreeNSequence.solve_for(13).should == 9
    ThreeNSequence.solve_for(5).should == 5
  end
  
end

