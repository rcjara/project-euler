require File.dirname( File.expand_path( __FILE__) ) + "/../lib/min_path_matrix.rb"

describe MinPathMatrix do
  before(:each) do
    @mat = MinPathMatrix.new( [[131, 673, 234, 103, 18 ],
                               [201, 96 , 342, 965, 150],
                               [630, 803, 746, 422, 111],
                               [537, 699, 497, 121, 956],
                               [805, 732, 524, 37 , 331]])
  end

  it "should get the right min sum" do
    @mat.min_sum.should == 2427
  end

  it "should get the right diagonals" do
    @mat.diagonals.should == [ [ [4, 4] ],
                               [ [3, 4], [4, 3] ],
                               [ [2, 4], [3, 3], [4, 2] ],
                               [ [1, 4], [2, 3], [3, 2], [4, 1] ],
                               [ [0, 4], [1, 3], [2, 2], [3, 1], [4, 0] ],
                               [ [0, 3], [1, 2], [2, 1], [3, 0] ],
                               [ [0, 2], [1, 1], [2, 0] ],
                               [ [0, 1], [1, 0] ],
                               [ [0, 0] ] ]

  end
  
  
end

