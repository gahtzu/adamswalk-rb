require 'adams_walk'
require 'rspec'

describe "AdamsWalk.run" do
  before do
    AdamsWalk.mock!
  end
  
  it "greets you" do
    AdamsWalk.run
    AdamsWalk.messages.include?("You are Adam from The Village!").should == true
  end
  
  it "displays initial health as 0" do
    AdamsWalk.run
    AdamsWalk.messages.include?("Health: 0\n\nWalk\nExplore\nInventory\nQuit\n").should == true
  end
    
end

describe "AdamsWalk.print" do
  before do
    AdamsWalk.mock!
  end
  
  it "messages is empty by default" do
    AdamsWalk.messages.should == []
  end

  it "it correctly prints when mocked" do
    AdamsWalk.print "one"
    AdamsWalk.print "two"
    AdamsWalk.print "three"
    
    AdamsWalk.messages.should == ["one", "two", "three"]
  end
end

describe "AdamsWalk.battling?" do
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

