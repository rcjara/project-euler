require_relative "../lib/fraction_reductions.rb"
require "benchmark"

describe FractionReductions do
  context "#naive" do
    it "should get the right answer for 12" do
      FractionReductions::naive(12).should == 8
    end

  end

  context "#by_factors" do
    it "should get the right answer for 12" do
      FractionReductions::by_factors(12).should == 8
    end
  end

  context "#naive and #by_factors" do
    it "should agree for a number of values" do
      (1..210).each do |i|
        {i => FractionReductions::by_factors(i)}.should == {i => FractionReductions::naive(i)}
      end
    end

    it "should agree for a number composed of 6 primes" do
      i = [2, 2, 3, 5, 7, 11, 13].inject(&:*)
      {i => FractionReductions::by_factors(i)}.should == {i => FractionReductions::naive(i)}

    end

  end

#  context "benchmarking" do
#    it "should do benchmarkingn stuff" do
#      Benchmark.bm do |bm|
#        bm.report("naive1") do
#          (1..2310).each {|i| FractionReductions.naive(i) }
#        end
#        bm.report("naive2") do
#          (1..2310).each {|i| FractionReductions.naive(i) }
#        end
#        bm.report("by_factors1") do
#          (1..2310).each {|i| FractionReductions.by_factors(i) }
#        end
#        bm.report("by_factors2") do
#          (1..2310).each {|i| FractionReductions.by_factors(i) }
#        end
#      end
#    end
#  end

end

