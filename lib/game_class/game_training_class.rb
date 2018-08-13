class Training
  include Rollable
  include Textable
  include Displayable
  extend Displayable
  include Validable
  include Logging

  TRAINING_TITLE = 'Entrainement'.freeze
  SOLO_TRAINING_TITLE = 'Entrainement Solo'.freeze
  MULTI_TRAINING_TITLE = 'Entrainement en Equipe'.freeze

  attr_reader :player, :teamates, :squires, :game

  def initialize(player, game)
    @player   = player
    @teamates = set_teamates
    @squires  = []
    @game = game
    @training = true
    @playing = true
  end

  def has_left_training?
    @training == false
  end

  def has_stopped_playing?
    @playing == false
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
