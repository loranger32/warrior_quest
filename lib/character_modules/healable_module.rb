module Healable
  def self.describe_healing_of(healer, other_char)
    puts "LE SORTILEGE DE SOINS DEBUTE: "
    puts "#{healer.name} soigne #{other_char.name} avec son sort de soins."
    puts "Points de vie avant le soin: #{other_char.hp}."
    healer.heal(other_char)
    puts ''
    puts "RESULTAT:"
    puts "#{other_char.name} a maintenant #{other_char.hp} points de vie."
    puts ''
  end

  def heal(other_person)
    other_person.restore_hp_by(30)
  end
end
