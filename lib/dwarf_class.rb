require_relative 'character_class'
require_relative 'repairable_module'

class Dwarf < Character
  include Repairable

  def self.create_passipti
    self.new(name: 'Passipti', hp: 140, strength: 13, spirit: 7, agility: 16)
  end

  def show_stats
    stats = <<-STRING
***********************************
Statistiques de #{self} (Nain):
  - points de vie:  #{hp}
  - force:          #{strength}
  - esprit:         #{spirit}
  - habileté:       #{agility}
  - mana:           #{mana}
  - arme:           #{weapon.name}
***********************************
    STRING
    puts stats
  end

  def pepare_solid_defense
    self.agility *= 3
  end

  private

  def serialized_pnj_name
    @@number_of_pnj += 1
    @name = "pnj_#{@@number_of_pnj}"
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
