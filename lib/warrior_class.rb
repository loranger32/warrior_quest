require_relative 'character_class'

class Warrior < Character
  attr_accessor :mana

  def post_initialize(args= {})
    @mana = args[:mana] || default_mana
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

  def look_around(space)
    space.description
  end

  private

  def default_mana
    25
  end
end
