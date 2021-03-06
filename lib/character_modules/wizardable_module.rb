# Module used to cast spells - to be included in relevant characters class
module Wizardable
  def self.describe_combat_between(char1, char2)
    describe_and_perform_spell_casting(char1, char2)
    display_attack_result(char1, char2)
  end

  def self.describe_and_perform_spell_casting(char1, char2)
    puts 'L\'ATTAQUE DEBUTE: '
    puts "#{char1.name} lance une boule de feu sur #{char2.name}."
    char1.cast_fire_ball_on(char2)
  end

  def self.display_attack_result(char1, char2)
    if char1.last_inflicted_damage > 0
      puts "Il lui inflige #{char1.last_inflicted_damage} points de vie de\
 dégats.\n"
    else
      puts 'La boule de feu passe à côté et ne lui inflige aucun dégât.\n'
    end
    puts 'RESULTAT:'
    puts "#{char2.name} a #{char2.hp} points de vie.\n"
  end

  def cast_fire_ball_on(other_char)
    last_inflicted_damage =
      fire_ball_damage_points - other_char.fire_ball_defense_points
    if last_inflicted_damage > 0
      other_char.reduce_hp_by(last_inflicted_damage)
      self.last_inflicted_damage = last_inflicted_damage
    else
      self.last_inflicted_damage = 0
    end
  end

  def fire_ball_damage_points
    spirit + throw_dice_of_8_times(2)
  end
end
