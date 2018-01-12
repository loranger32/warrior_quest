# Module for healing - to be included in relevant characters class
module Healable
  SIMPLE_HEAL = 30
  def self.describe_healing_of(healer, other_char)
    puts 'LE SORTILEGE DE SOINS DEBUTE: '
    puts "#{healer.name} soigne #{other_char.name} avec son sort de soins."
    puts "Points de vie avant le soin: #{other_char.hp}."
    healer.heal(other_char)
    puts ''
    puts 'RESULTAT:'
    puts "#{other_char.name} a maintenant #{other_char.hp} points de vie."
    puts ''
  end

  def self.describe_self_healing(healer)
    puts 'LE SORTILEGE DE SOINS DEBUTE: '
    puts "#{healer.name} invoque un sort de soins sur lui-même."
    puts "Points de vie avant le soin: #{healer.hp}."
    healer.heal_self
    puts ''
    puts 'RESULTAT:'
    puts "#{healer.name} a maintenant #{healer.hp} points de vie."
    puts ''
  end

  def heal(other_person)
    other_person.restore_hp_by(SIMPLE_HEAL)
  end

  def heal_self
    restore_hp_by(SIMPLE_HEAL)
  end
end
