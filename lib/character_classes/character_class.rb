require_relative '../item_modules/rollable_module'
require_relative '../item_classes/weapons_class'
require_relative '../character_modules/fightable_module'

# Abstract class - not meant to be instantiated
class Character
  include Rollable
  include Fightable

  attr_accessor :hp, :spirit, :agility, :strength, :weapon, :name, :mana,
                :last_inflicted_damage
  attr_reader   :max_hp, :type

  @number_of_pnj = 0

  class << self
    attr_accessor :number_of_pnj
  end

  # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength, Metrics/PerceivedComplexity
  def initialize(args = {})
    @type     = set_type
    @name     = args[:name]                  || serialized_pnj_name
    @hp       = args[:hp]                    || default_hp
    @strength = args[:strength]              || default_strength
    @spirit   = args[:spirit]                || default_spirit
    @agility  = args[:agility]               || default_agility
    @mana     = args[:mana]                  || default_mana
    @weapon   = assign_weapon(args[:weapon]) || default_weapon
    @max_hp   = @hp
    @last_inflicted_damage = 0

    post_initialize(args)
  end
  # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity,
  # rubocop:enable Metrics/MethodLength, Metrics/PerceivedComplexity

  def reduce_hp_by(damages_to_character)
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

  def stunt?
    hp < 20
  end

  def dead?
    hp <= 0
  end

  def defense_points
    agility + throw_die_of_4_times(1) + weapon.defense_bonus
  end

  def fire_ball_defense_points
    agility + throw_die_of_4_times(1)
  end

  def to_s
    @name.capitalize
  end

  # rubocop:disable Metrics/MethodLength
  def stats_display
    <<~STRING
      ***********************************
      Statistiques de #{self} (#{type}):
        - points de vie:  #{hp}
        - force:          #{strength}
        - esprit:         #{spirit}
        - habileté:       #{agility}
        - mana:           #{mana}
        - arme:           #{weapon.name}
      ***********************************
    STRING
  end
  # rubocop:enable Metrics/MethodLength

  # rubocop:disable Metrics/CyclomaticComplexity
  def assign_weapon(weapon)
    case weapon
    when :bare_hands  then BareHands.new
    when :sword       then Sword.new
    when :staff       then Staff.new
    when :axe         then Axe.new
    when :spear       then Spear.new
    when :short_sword then ShortSword.new
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  private

  def set_type
    'PNJ'
  end

  def serialized_pnj_name
    Character.number_of_pnj += 1
    @name = "pnj_#{@number_of_pnj}"
  end

  def default_hp
    self.hp = self.class::DEFAULTS[:hp]
  end

  def default_strength
    self.strength = self.class::DEFAULTS[:strength]
  end

  def default_spirit
    self.spirit = self.class::DEFAULTS[:spirit]
  end

  def default_agility
    self.agility = self.class::DEFAULTS[:agility]
  end

  def default_mana
    self.mana = self.class::DEFAULTS[:mana]
  end

  def default_weapon
    self.weapon = assign_weapon(self.class::DEFAULTS[:weapon])
  end

  def post_initialize(_options)
    nil
  end
end
