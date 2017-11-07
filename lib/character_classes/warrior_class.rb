require_relative 'character_class'

class Warrior < Character
  def self.create_hero
    self.new(name: 'Bargdun', hp: 160, strength: 16, spirit: 12, agility: 10,
              weapon: :sword, mana: 35)
  end

  def look_around(space)
    space.description
  end

  def dance
    puts "Vous effectuez quelque pas de danse plein de grâce et de légerté.\
 Vos mouvements sont un enchantement pour le regard, et une démonstration\
 d'équilibre maîtrisé. "
    sleep(5)
    puts "Bon sérieusement ?"
    sleep(3)
    puts "Vous dansez comme un automate rouillé à qui on aurait attaché les\
 jambes. Mais je pense que le geste a été apprécié: tout le monde rigole."
  end

  private

  def set_type
    "Guérrier"
  end

  def default_mana
    25
  end
end
