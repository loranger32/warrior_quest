module Wizardable
  def self.describe_combat_between(char_1, char_2)
    puts "L'ATTAQUE DEBUTE: "
    puts "#{char_1.name} lance une boule de feu sur #{char_2.name}."
    char_1.cast_fire_ball_on(char_2)
    if char_1.last_inflicted_damage > 0
      puts "Il lui inflige #{char_1.last_inflicted_damage} points de vie de\
 dégats."
    else
      puts "La boule de feu passe à côté et ne lui inflige aucun dégât."
    end
    puts ''
    puts "RESULTAT:"
    puts "#{char_2.name} a #{char_2.hp} points de vie"
    puts ''
  end

  def cast_fire_ball_on(other_char)
    last_inflicted_damage = 
      fire_ball_damage_points - other_char.fire_ball_defense_points
    if last_inflicted_damage > 0 
      other_char.reduce_hp(last_inflicted_damage)
      self.last_inflicted_damage = last_inflicted_damage
    else
      self.last_inflicted_damage = 0
    end
  end

  def fire_ball_damage_points
    spirit + throw_die_of_8_times(2)
  end
end
