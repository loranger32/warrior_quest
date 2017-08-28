require_relative 'character_class'

class Warrior < Character
  attr_accessor :mana

  def post_initialize(args= {})
    @mana = args[:mana]
  end

  def show_stats
    stats = <<-STRING
***********************************
Statistiques de #{self} (guérrier):
  - points de vie:  #{hp}
  - force:          #{strength}
  - esprit:         #{spirit}
  - habileté:       #{agility}
  - mana:           #{mana}
  - arme:           #{weapon.name}
***********************************
    STRING
    puts stats
  end

  def leader_call
    
  end
end
