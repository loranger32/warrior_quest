require_relative 'character_class'
require_relative '../character_modules/healable_module'

# Concrete class
class Elve < Character
  include Healable

  DEFAULTS = { hp: 90, strength: 8, spirit: 12, agility: 10, mana: 25,
               weapon: :short_sword }.freeze

  def self.create_toudou
    new(name: 'Toudou', hp: 110, strength: 11, spirit: 14, agility: 14)
  end

  private

  def set_type
    'Elfe'
  end

  def default_weapon
    ShortSword.new
  end
end
