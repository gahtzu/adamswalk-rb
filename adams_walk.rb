module AdamsWalk
  class BattleError < StandardError
  end

  def self.battling?(boss_health, adam_health)
    raise BattleError if boss_health < 0 || adam_health < 0
    boss_health > 0 && adam_health > 0
  end
end