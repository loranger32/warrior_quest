module Fightable
  def self.describe_combat_between(char_1, char_2)
    puts "#{char_1.name} attaque #{char_2.name} avec son #{char_1.weapon.name}."
    char_1.attack(char_2)
    if char_1.last_inflicted_damage > 0
      puts "Il lui inflige #{char_1.last_inflicted_damage} points de vie de\
 dégats."
    else
      puts "Son attaque manque son coup, il ne lui inflige aucun point de\
 dégat."
    end
    puts ''
    puts "RESULTAT:"
    puts "#{char_2.name} a #{char_2.hp} points de vie"
    puts ''
  end

  def attack(other_character)
    if damage_points > other_character.defense_points
      self.last_inflicted_damage = damage_points - other_character.defense_points
      other_character.reduce_hp(last_inflicted_damage)
    else
      self.last_inflicted_damage = 0
    end
  end

  def damage_points
    strength + throw_die_of_8_times(2) + weapon.attack_bonus
  end

  def defense_points
    agility + throw_die_of_4_times(1) + weapon.defense_bonus
  end
end
