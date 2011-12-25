module AdamsWalk
  class BattleError < StandardError
  end

  def self.mocked?
    @mocked
  end
  
  def self.messages
    @messages
  end

  def self.mock!
    @mocked = true
    @messages = []
  end
  
  def self.unmock!
    @mocked = false
    @messages = nil
  end

  def self.print(message)
    if mocked?
      @messages << message
    else
      puts message
    end
  end
  
  def self.run
    print "You are Adam from The Village!"
    boss_health = adam_health = 0
    print "Health: #{adam_health}\n\nWalk\nExplore\nInventory\nQuit\n"
  end

  def self.battling?(boss_health, adam_health)
    raise BattleError if boss_health < 0 || adam_health < 0
    boss_health > 0 && adam_health > 0
  end

  unmock!
end