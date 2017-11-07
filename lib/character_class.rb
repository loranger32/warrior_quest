require_relative 'rollable_module'
require_relative 'weapons_class'
require_relative 'fightable_module'

class Character
  attr_accessor :hp, :spirit, :agility, :strength, :weapon, :name,
    :last_inflicted_damage
  attr_reader :max_hp

  include Rollable
  include Fightable

  @@number_of_pnj = 0

  def initialize(args={})
    @name     = args[:name]               || serialized_pnj_name
    @hp       = args[:hp]                 || default_hp
    @strength = args[:strength]           || default_strength
    @spirit   = args[:spirit]             || default_spirit
    @agility  = args[:agility]            || default_agility
    @weapon   = set_weapon(args[:weapon]) || default_weapon
    @last_inflicted_damage = 0
    @max_hp   = @hp
    
    post_initialize(args)
  end

  def reduce_hp(damages_to_character)
    if hp - damages_to_character <= 0
      self.hp = 0
    else
      self.hp -= damages_to_character
    end
  end

  def restore_hp_by(hp_to_character)
    if self.hp + hp_to_character <= @max_hp
      self.hp += hp_to_character
    else
      self.hp = @max_hp
    end
  end

  def to_s
    @name.capitalize
  end

  def show_stats
    stats = <<-STRING
***********************************
Statistiques de #{self}:
  - points de vie:  #{hp}
  - force:          #{strength}
  - esprit:         #{spirit}
  - habileté:       #{agility}
  - arme:           #{weapon.name}
***********************************
    STRING
    puts stats
  end

  private

  def serialized_pnj_name
    @@number_of_pnj += 1
    @name = "pnj_#{@@number_of_pnj}"
  end

  def default_hp
    100
  end

  def default_strength
    8
  end

  def default_spirit
    8
  end

  def default_agility
    8
  end

  def set_weapon(weapon)
    case weapon
    when :bare_hands  then BareHands.new
    when :sword       then Sword.new
    when :staff       then Staff.new
    when :axe         then Axe.new
    when :spear       then Spear.new
    when :short_sword then ShortSword.new
    end
  end

  def default_weapon
    BareHands.new
  end

  def post_initialize(_options)
    nil
  end
end
