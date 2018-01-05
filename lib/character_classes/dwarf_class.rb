require_relative 'character_class'
require_relative '../item_modules/repairable_module'

# Concrete class
class Dwarf < Character
  include Repairable

  DEFAULTS = { hp: 130, strength: 12, spirit: 6, agility: 13, mana: 'none',
               weapon: :spear }.freeze

  def self.create_passipti
    new(name: 'Passipti', hp: 140, strength: 13, spirit: 7, agility: 15)
  end

  def pepare_solid_defense
    self.agility *= 2
  end

  private

  def set_type
    'Nain'
  end

  def default_weapon
    Spear.new
  end
end
