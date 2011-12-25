module AdamsWalk
  class BattleError < StandardError
  end

  def self.battle_over?(boss_health, adam_health)
    boss_health > 0 || adam_health > 0
  end
end