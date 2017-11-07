require_relative 'character_class'
require_relative '../character_modules/healable_module'

class Elve < Character
  include Healable

  def self.create_toudou
    self.new(name: 'Toudou', hp: 110, strength: 11, spirit: 14, agility: 14)
  end

  private

  def set_type
    "Elfe"
  end

  def default_hp
    130
  end

  def default_strength
    12
  end

  def default_spirit
    6
  end

  def default_agility
    14
  end

  def default_mana
    25
  end

  def set_weapon(weapon)
    case weapon
    when :bare_hands  then BareHands.new
    when :sword       then Sword.new
    when :staff       then Staff.new
    when :axe         then Axe.new
    when :spear       then Spear.new
    when :short_sword then ShortSword.new
    end
  end

  def default_weapon
    ShortSword.new
  end
end
