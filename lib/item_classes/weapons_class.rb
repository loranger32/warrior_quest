# Abstract Class - not designed for instantiation
class Weapon
  
  
<<<<<<< HEAD
  attr_accessor :name, :display_name, :attack_bonus, :defense_bonus, :durability 
=======
  attr_accessor :name, :attack_bonus, :defense_bonus, :durability
>>>>>>> eb983d1f4972346e689c445763aaec345f794b16
  attr_reader :max_durability

  def initialize(options = {})
    @name             = options[:name]             || set_default_name
    @display_name     = options[:display_name]     || set_default_display_name
    @attack_bonus     = options[:attack_bonus]     || set_default_attack_bonus
    @defense_bonus    = options[:defense_bonus]    || set_default_defense_bonus
    @durability       = options[:durability]       || set_default_durability
    @max_durability   = @durability
    post_initialize(options)
  end

  def post_initialize(_options)
    nil
  end

  def set_default_name
    self.name = self.class::DEFAULTS[:name]
  end

  def set_default_display_name
    self.display_name = self.class::DEFAULTS[:display_name]
  end

  def set_default_attack_bonus
    self.attack_bonus = self.class::DEFAULTS[:attack_bonus]
  end

  def set_default_defense_bonus
    self.defense_bonus = self.class::DEFAULTS[:defense_bonus]
  end

  def set_default_durability
    self.durability = self.class::DEFAULTS[:durability]
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

# Concrete class
class BareHands < Weapon
  DEFAULTS = { name: 'Mains nues',
               display_name: 'ses mains nues',
               attack_bonus: 0,
               defense_bonus: 0,
               durability: 50 }.freeze
end

# Concrete class
class Sword < Weapon
  DEFAULTS = { name: 'Epée',
               display_name: 'son épée',
               attack_bonus: 15,
               defense_bonus: 10,
               durability: 50 }.freeze
end

# Concrete class
class Axe < Weapon
  DEFAULTS = { name: 'Hache à deux mains',
               display_name: 'sa hache à deux mains',
               attack_bonus: 30,
               defense_bonus: 10,
               durability: 80 }.freeze
end

# Concrete class
class Staff < Weapon
  DEFAULTS = { name: 'Baton',
               display_name: 'son bâton',
               attack_bonus: 5,
               defense_bonus: 5,
               durability: 30 }.freeze
end

# Concrete class
class Spear < Weapon
  DEFAULTS = { name: 'Lance',
               display_name: 'sa lance',
               attack_bonus: 20,
               defense_bonus: 20,
               durability: 100 }.freeze
end

# Concrete class
class ShortSword < Weapon
  DEFAULTS = { name: 'Dague',
               display_name: 'sa dague',
               attack_bonus: 10,
               defense_bonus: 5,
               durability: 50 }.freeze
end
