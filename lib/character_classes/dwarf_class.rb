require_relative 'character_class'
require_relative '../item_modules/repairable_module'

class Dwarf < Character
  include Repairable

  def self.create_passipti
    self.new(name: 'Passipti', hp: 140, strength: 13, spirit: 7, agility: 15)
  end

  def pepare_solid_defense
    self.agility *= 2
  end

  private

  def set_type
    "Nain"
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
    13
  end

  def default_mana
    "no mana"
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
    Spear.new
  end
end
