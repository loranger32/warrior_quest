class Weapon
  attr_accessor :name, :attack_bonus, :defense_bonus, :durability
  attr_reader :max_durability

  def initialize(options = {})
    @name           = options[:name]          || set_default_name
    @attack_bonus   = options[:attack_bonus]  || set_default_attack_bonus
    @defense_bonus  = options[:defense_bonus] || set_default_defense_bonus
    @durability     = options[:durability]    || set_default_durability
    @max_durability = @durability
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
    if durability - damages_to_weapon <= 0
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


class BareHands < Weapon
  def set_default_name
    self.name = "Mains nues"
  end

  def set_default_attack_bonus
    self.attack_bonus = 0
  end

  def set_default_defense_bonus
    self.defense_bonus = 0
  end

  def set_default_durability
    self.durability = 200
  end
end

class Sword < Weapon
  DEFAULTS = { name: "Epée", 
               attack_bonus: 15,
               defense_bonus: 10,
               durability: 50 }

  def set_default_name
    self.name = DEFAULTS[:name]
  end

  def set_default_attack_bonus
    self.attack_bonus = DEFAULTS[:attack_bonus]
  end

  def set_default_defense_bonus
    self.defense_bonus = DEFAULTS[:defense_bonus]
  end

  def set_default_durability
    self.durability = DEFAULTS[:durability]
  end
end

class Axe < Weapon
  DEFAULTS = { name: "Hache à deux mains", 
               attack_bonus: 30,
               defense_bonus: 10,
               durability: 80 }

  def set_default_name
    self.name = DEFAULTS[:name]
  end

  def set_default_attack_bonus
    self.attack_bonus = DEFAULTS[:attack_bonus]
  end

  def set_default_defense_bonus
    self.defense_bonus = DEFAULTS[:defense_bonus]
  end

  def set_default_durability
    self.durability = DEFAULTS[:durability]
  end
end

class Staff < Weapon
  def set_default_name
    self.name = "Baton"
  end

  def set_default_attack_bonus
    self.attack_bonus = 5
  end

  def set_default_defense_bonus
    self.defense_bonus = 5
  end

  def set_default_durability
    self.durability = 30
  end
end

class Spear < Weapon
  def set_default_name
    self.name = "Lance"
  end

  def set_default_attack_bonus
    self.attack_bonus = 20
  end

  def set_default_defense_bonus
    self.defense_bonus = 20
  end

  def set_default_durability
    self.durability = 100
  end
end

class ShortSword < Weapon
  def set_default_name
    self.name = "Dague"
  end

  def set_default_attack_bonus
    self.attack_bonus = 10
  end

  def set_default_defense_bonus
    self.defense_bonus = 5
  end

  def set_default_durability
    self.durability = 50
  end
end
