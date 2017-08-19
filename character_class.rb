require_relative 'rollable_module'
require_relative 'weapons_class'

class Character
  attr_accessor :hp, :spirit, :agility, :strength, :weapon
  attr_reader :name, :max_hp

  include Rollable

  @@number_of_pnj = 0

  def initialize(args={})
    @name     = args[:name]                    || serialized_pnj_name
    @hp       = args[:hp]                      || default_hp
    @strength = args[:strength]                || default_strength
    @spirit   = args[:spirit]                  || default_spirit
    @agility  = args[:agility]                 || default_agility
    @weapon   = set_weapon(args[:weapon])      || default_weapon
    @max_hp   = @hp
    
    post_initialize({})
  end

  def to_s
    @name.capitalize
  end

  def attack(other_player)
    other_player.hp -= damage_points
  end

  def damage_points
    strength + throw_die_of_8_times(2) + weapon.attack_bonus
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
