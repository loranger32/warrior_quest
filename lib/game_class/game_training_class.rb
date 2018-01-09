class Training
  include Rollable
  include Textable
  include Displayable
  include Validable

  attr_reader :player, :teamates, :squires

  def initialize
    @player   = Warrior.create_hero
    @teamates = set_teamates
    @squires  = [] 
  end

  private

  def set_teamates
    team = []
    team << Dwarf.create_passipti
    team << Elve.create_toudou
    team << Wizard.create_hocus_pocus
    team
  end

  def set_two_squires
    squires.clear
    squires << Squire.create("Barnabé")
    squires << Squire.create("Rahan")
  end

  def set_four_squires
    set_two_squires
    squires << Squire.create("Virgile")
    squires << Squire.create("Alphonse")
  end
end
