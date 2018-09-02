class Training
  include Rollable
  include Textable
  include Displayable
<<<<<<< HEAD
  extend Displayable
=======
>>>>>>> eb983d1f4972346e689c445763aaec345f794b16
  include Validable
  include Logging

  TRAINING_TITLE = 'Entrainement'.freeze
<<<<<<< HEAD
=======
  SOLO_TRAINING_TITLE = 'Entrainement Solo'.freeze
  MULTI_TRAINING_TITLE = 'Entrainement en Equipe'.freeze
>>>>>>> eb983d1f4972346e689c445763aaec345f794b16

  attr_reader :player, :teamates, :squires, :game

  def initialize(player, game)
    @player   = player
<<<<<<< HEAD
    @game     = game
    @training = true
  end

  def quit_training
    @training = false
  end

  def has_left_training?
    @training == false
  end

  def play
    clear_screen_with_title(TRAINING_TITLE)
    present_training
    loop do
      play_single_or_multiplayer_training
      break if has_left_training?

      if play_again?
        player.restore_max_hp
        display_new_training
      else
        break
      end
    end

    game.return_from_training
  end

  def present_training
    print_message(Textable::TrainingText.present_training)
  end

  def play_single_or_multiplayer_training
    training_type = ask_for_single_or_multiplayer_training
    case training_type
    when 's' then SinglePlayerTraining.new(player, self).play
    when 'm' then MultiplayerTraining.new(player, self).play
    when 'q' then quit_training
    end
  end

  def play_again?
    prompt("Souhaitez-vous refaire un combat d'entrainement ? ('o', 'n')")
    choice = Validable.obtain_a_valid_input_from_list(['o', 'n'])
    choice == 'o'
  end

  def display_new_training
    clear_screen_with_title(TRAINING_TITLE)
    print_message("C'est parti pour une nouvelle séance d'entrainement !")
  end

  def ask_for_single_or_multiplayer_training
    prompt(Textable::TrainingText.ask_single_or_multiplayer_training)
    Validable.obtain_a_valid_input_from_list(['s', 'm', 'q'])
  end

  def quit_training
    @training = false
=======
    @teamates = set_teamates
    @squires  = []
    @game = game
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
>>>>>>> eb983d1f4972346e689c445763aaec345f794b16
  end
end
