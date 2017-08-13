class Weapon
  attr_accessor :attack_bonus, :defense_bonus, :durability
  attr_reader :name

  def initialize(options = {})
    @name           = options[:name]
    @attack_bonus   = options[:attack_bonus]
    @defense_bonus  = options[:defense_bonus]
    @durability     = options[:durability]
    @max_durability = options[:durability].freeze
    post_initialize(options)
  end

  def post_initialize(_options)
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
