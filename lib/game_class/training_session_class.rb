# Abstract class - Not to be initialized
class TrainingSession
  include Rollable
  include Textable
  include Displayable
  extend Displayable
  include Validable
  include Logging

  attr_reader :player, :training

  def initialize(player, training, options = {})
    @player = player
    @training = training
    @playing = true
    post_initialize(options)
  end

  def post_initialize(_options)
    nil
  end

  def title
    self.class::TITLE
  end

  def actions
    self.class::ACTIONS
  end

  def viewing_actions
    self.class::VIEWING_ACTIONS
  end

  def text
    Textable::TrainingText
  end

  def quit_playing
    @playing = false
  end

  def has_stopped_playing?
    !@playing
  end

  def play
    raise "Method needs to be implemented by concrete class"
  end

  def show_squires
    print_message("Vos adversaires d'entrainement sont:")
    squires.each { |squire| puts "- #{squire}".blue }
  end

  def show_individual_squire_stats(squire_number)
    squire = squires[squire_number - 1]
    squire.print_stats
  end

  def show_squires_stats
    print_message("Leurs statistiques sont:")
    squires.each { |squire| print_message(squire.stats_display) }
  end

  def player_is_not_stunt?
    !player.stunt?
  end

  def player_is_stunt?
    player.stunt?
  end

  def all_squires_are_stunt?
    squires.all?(&:stunt?)
  end

  def squire_passed_out(squire)
    print_message(Textable::TrainingText.too_bad_a_squire_passe_out(squire))
  end

  def one_squire_died?
    squires.any?(&:dead?)
  end

  def dead_squire
    squires.find(&:dead?)
  end

  def display_player_stats
    player.print_stats
  end

  def set_two_squires
    squires = []
    squires << Squire.create("Barnabé")
    squires << Squire.create("Rahan")
    squires
  end

  def set_four_squires
    squires = set_two_squires
    squires << Squire.create("Virgile")
    squires << Squire.create("Alphonse")
    squires
  end
end
