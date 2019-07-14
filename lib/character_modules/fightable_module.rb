# Module for classic fights with weapons - to be included in character class
module Fightable
  def self.describe_combat_between(char1, char2)
    describe_and_perform_attack(char1, char2)
    display_attack_result(char1, char2)
  end

  def attack(other_char)
    last_inflicted_damage = damage_points - other_char.defense_points
    if last_inflicted_damage > 0
      other_char.reduce_hp_by(last_inflicted_damage)
      self.last_inflicted_damage = last_inflicted_damage
    else
      self.last_inflicted_damage = 0
    end
  end

  def self.describe_and_perform_attack(char1, char2)
    puts 'L\'ATTAQUE DEBUTE: '
    puts "#{char1.name} attaque #{char2.name} avec #{char1.weapon.display_name}."
    char1.attack(char2)
  end

  def self.display_attack_result(char1, char2)
    if char1.last_inflicted_damage > 0
      puts "Il lui inflige #{char1.last_inflicted_damage} points de vie de\
 dégats.\n"
    else
      puts "Il rate son coup, et ne lui inflige aucun point de dégat.\n"
    end
    puts 'RESULTAT:'
    puts "#{char2.name} a #{char2.hp} points de vie.\n"
  end

  def damage_points
    strength + throw_dice_of_8_times(2) + weapon.attack_bonus
  end

  
  def defense_points
    agility + throw_dice_of_4_times(1) + weapon.defense_bonus
  end
end
