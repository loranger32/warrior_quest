class Character
  attr_accessor :hp, :strength, :spirit, :agility
  attr_reader :name

  def initialize(args={})
    @name     = args[:name]
    @hp       = args[:hp]       || default_hp
    @strength = args[:strength] || default_strength
    @spirit   = args[:spirit]   || default_spirit
    @agility  = args[:agility]  || default_agility

    post_initialize(options={})
  end

  def say_hello
    puts "Hello!"
  end


  private

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
