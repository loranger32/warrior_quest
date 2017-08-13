class Weapon
  attr_accessor :name, :attack_bonus, :defense_bonus, :durability

  def initialize(options = {})
    @name           = options[:name]          || set_default_name
    @attack_bonus   = options[:attack_bonus]  || set_default_attack_bonus
    @defense_bonus  = options[:defense_bonus] || set_default_defense_bonus
    @durability     = options[:durability]    || set_default_durability
    @max_durability = @durability.dup.freeze
    post_initialize(options)
  end

  def post_initialize(_options)
    nil
  end

  def set_default_name
    nil
  end

  def set_default_attack_bonus
    nil
  end

  def set_default_defense_bonus
    nil
  end

  def set_default_durability
    nil
  end

  def impair_by(damages_to_weapon)
    if self.durability - damages_to_weapon <= 0
      self.durability = 0
    else
      self.durability -= damages_to_weapon
    end
  end

  def repair_by(restores_to_weapon)
    if self.durability + restores_to_weapon <= @max_durability
      self.durability += restores_to_weapon
    else
      self.durability = @max_durability
    end
  end
end

class Sword < Weapon
  def set_default_name
    self.name = "Epée"
  end

  def set_default_attack_bonus
    self.attack_bonus = 15
  end

  def set_default_defense_bonus
    self.defense_bonus = 5
  end

  def set_default_durability
    50
  end
end
