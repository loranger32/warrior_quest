require_relative 'character_class'
require_relative '../character_modules/healable_module'

# Concrete class
class Warrior < Character
  include Healable

  DEFAULTS = { hp: 120, strength: 12, spirit: 10, agility: 10, mana: 25,
               weapon: :sword }.freeze

  def self.create_hero
    new(name: 'Leo', hp: 160, strength: 16, spirit: 12, agility: 10,
        weapon: :spear, mana: 35)
  end

  def look_around(space)
    space.description
  end

  def dance
    puts 'Vous effectuez quelque pas de danse plein de grâce et de légerté.\
 Vos mouvements sont un enchantement pour le regard, et une démonstration\
 d\'équilibre maîtrisé.'
    sleep(5)
    puts 'Bon sérieusement ?'
    sleep(3)
    puts 'Vous dansez comme un automate rouillé à qui on aurait attaché les\
 jambes. Mais je pense que le geste a été apprécié: tout le monde rigole.'
  end

  private

  def set_type
    'Guérrier'
  end
end
