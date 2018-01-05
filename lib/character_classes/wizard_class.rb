require_relative 'character_class'
require_relative '../character_modules/wizardable_module'

# Concrete class
class Wizard < Character
  include Wizardable

  DEFAULTS = { hp: 70, strength: 4, spirit: 14, agility: 6, mana: 50,
               weapon: :staff }.freeze

  def self.create_hocus_pocus
    new(name: 'Hocuspocus', hp: 80, strength: 6, spirit: 16, agility: 8,
        mana: 65)
  end

  private

  def set_type
    'Magicien'
  end
end
