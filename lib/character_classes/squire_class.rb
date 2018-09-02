class Squire < Character

  DEFAULTS = { hp: 85, strength: 8, spirit: 12, agility: 10, mana: 'none',
               weapon: :sword }.freeze

  def self.create(name)
    new(name: name, hp: 85, strength: 8, spirit: 12, agility: 10)
  end

  private

  def set_type
    'Ecuyer'
  end

  def default_weapon
    Sword.new
  end
end
