class Character
  attr_accessor :hp, :spirit, :agility, :strength
  attr_reader :name

  @@number_of_pnj = 0

  def initialize(args={})
    @name     = args[:name]     || serialized_pnj_name
    @hp       = args[:hp]       || default_hp
    @strength = args[:strength] || default_strength
    @spirit   = args[:spirit]   || default_spirit
    @agility  = args[:agility]  || default_agility

    post_initialize(options={})
  end

  def to_s
    @name.capitalize
  end

  def attack(other_player)
    other_player.hp -= strength
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

  def post_initialize(options={})
    nil
  end
end
