class Training
  include Rollable
  include Textable
  include Displayable
  include Validable

  attr_reader :player, :teamates

  def initialize
    @player   = Warrior.create_hero
    @teamates = set_teamates
  end

  private

  def set_teamates
    team = []
    team << Dwarf.create_passipti
    team << Elve.create_toudou
    team << Wizard.create_hocus_pocus
    team
  end
end
