require_relative "../lib/matrix_traverser.rb"

describe MatrixTraverser do
  before(:each) do
    @matrix = [
      [131, 673, 234, 103,  18],
      [201,  96, 342, 965, 150],
      [630, 803, 746, 422, 111],
      [537, 699, 497, 121, 956],
      [805, 732, 524,  37, 331]
    ]
    @traverser = MatrixTraverser.new(@matrix)
  end

  it "should get the right path total" do
    @traverser.min_path_sum.should == 994
  end

  describe "sums for coordinated" do
    it "should get the right sum for coordinates (0, 1)" do
      @traverser.min_sum_to([0, 1]).should == (131 + 673)
    end

    it "should get the right sum for coordinates (1, 1)" do
      @traverser.min_sum_to([1, 1]).should == (201 + 96)
    end

    it "should get the right sum for coordinates (2, 1)" do
      @traverser.min_sum_to([2, 1]).should == (201 + 96 + 803)
    end

    it "should get the right sum for coordinates (3, 1)" do
      @traverser.min_sum_to([3, 1]).should == (537 + 699)
    end

    it "should get the right sum for coordinates (4, 1)" do
      @traverser.min_sum_to([4, 1]).should == (805 + 732)
    end
  end

  describe "paths to coordinates" do
    it "should get the right paths to (0, 1)" do
      @traverser.paths_to([0, 1]).should == [
        [ [0, 0], [0, 1] ],
        [ [1, 0], [1, 1], [0, 1] ],
        [ [2, 0], [2, 1], [1, 1], [0, 1] ],
        [ [3, 0], [3, 1], [2, 1], [1, 1], [0, 1] ],
        [ [4, 0], [4, 1], [3, 1], [2, 1], [1, 1], [0, 1] ]
      ]
    end

    it "should get the right paths to (2, 1)" do
      @traverser.paths_to([2, 1]).should == [
        [ [2, 0], [2, 1] ],
        [ [1, 0], [1, 1], [2, 1] ],
        [ [3, 0], [3, 1], [2, 1] ],
        [ [0, 0], [0, 1], [1, 1], [2, 1] ],
        [ [4, 0], [4, 1], [3, 1], [2, 1] ]
      ]
    end

  end



end
