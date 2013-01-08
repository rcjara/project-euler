require File.dirname( File.expand_path( __FILE__) ) + "/../lib/primes.rb"

describe Primes do
  it "should have the correct first 10 prime numbers" do
    Primes.first(10).should == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
  end
  
  it "should have the right thousandth prime number" do
    Primes[999].should == 7919
  end

  it "should be able to seed up to a certain number" do
    Primes.seed_under(7920)
    Primes[999].should == 7919
  end
  
  it "should be able to get a prime factorization" do
    Primes.factorization(25004).should == [2, 2, 7, 19, 47]
  end
  
  
end

