require 'adams_walk'
require 'rspec'

describe "AdamsWalk#battle_over?" do
  it "is false when both characters are over 0 health" do
    AdamsWalk.battle_over?(5, 8).should == false
  end

  it "is false when both characters are at 1 health" do
    AdamsWalk.battle_over?(1, 1).should == false
  end

  it "is true when both characters are at 0 health" do
    AdamsWalk.battle_over?(0, 0).should == true
  end

  it "is true when Boss is at 0 health" do
    AdamsWalk.battle_over?(0, 4).should == true
  end

  it "is true when Adam is at 0 health" do
    AdamsWalk.battle_over?(4, 0).should == true
  end

  it "is raises an error when both characters are below 0 health" do
    lambda do
      AdamsWalk.battle_over?(-4, -8)
    end.should raise_error(AdamsWalk::BattleError)
  end
  
  it "is raises an error when Boss is below 0 health" do
    lambda do
      AdamsWalk.battle_over?(-4, 8)
    end.should raise_error(AdamsWalk::BattleError)
  end

  it "is raises an error when Adam is below 0 health" do
    lambda do
      AdamsWalk.battle_over?(4, -8)
    end.should raise_error(AdamsWalk::BattleError)
  end
end

