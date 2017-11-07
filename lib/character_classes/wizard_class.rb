require_relative 'character_class'
require_relative '../character_modules/wizardable_module'

class Wizard < Character
  include Wizardable
  include Fightable

  def self.create_hocus_pocus
    self.new(name: 'Hocuspocus', hp: 80, strength: 6, spirit: 16, agility: 8,
      mana: 65)
  end

  private

  def set_type
    "Magicien"
  end

  def default_hp
    70
  end

  def default_strength
    4
  end

  def default_spirit
    14
  end

  def default_agility
    6
  end

  def default_mana
    50
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
    Staff.new
  end
end
