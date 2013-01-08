require File.dirname( File.expand_path( __FILE__) ) + "/../lib/multiples_solver.rb"
describe MultiplesSolver do
  it "should get the right answer for 6" do
    MultiplesSolver.solve(6).should == 8
  end
  
  it "should get the right answer for 10" do
    MultiplesSolver.solve(10).should == 23
  end
  
  it "should get the right answer for 20" do
    MultiplesSolver.solve(20).should == 78
  end

  it "should get the right answer for the problem" do
    MultiplesSolver.solve(1000).should == 233168
  end
  
  
end

