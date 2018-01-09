class Squire < Character
  DEFAULTS = { hp: 90, strength: 8, spirit: 12, agility: 10, mana: 'none',
               weapon: :sword }.freeze

  def self.create(name)
    new(name: name, hp: 110, strength: 11, spirit: 14, agility: 14)
  end

  private

  def set_type
    'Ecuyer'
  end

  def default_weapon
    Sword.new
  end
end
