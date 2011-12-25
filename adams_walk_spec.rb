require 'adams_walk'
require 'rspec'

describe "AdamsWalk#battling?" do
  it "is true when both characters are over 0 health" do
    AdamsWalk.battling?(5, 8).should == true
  end

  it "is true when both characters are at 1 health" do
    AdamsWalk.battling?(1, 1).should == true
  end

  it "is false when both characters are at 0 health" do
    AdamsWalk.battling?(0, 0).should == false
  end

  it "is false when Boss is at 0 health" do
    AdamsWalk.battling?(0, 4).should == false
  end

  it "is false when Adam is at 0 health" do
    AdamsWalk.battling?(4, 0).should == false
  end

  it "is raises an error when both characters are below 0 health" do
    lambda do
      AdamsWalk.battling?(-4, -8)
    end.should raise_error(AdamsWalk::BattleError)
  end
  
  it "is raises an error when Boss is below 0 health" do
    lambda do
      AdamsWalk.battling?(-4, 8)
    end.should raise_error(AdamsWalk::BattleError)
  end

  it "is raises an error when Adam is below 0 health" do
    lambda do
      AdamsWalk.battling?(4, -8)
    end.should raise_error(AdamsWalk::BattleError)
  end
end

