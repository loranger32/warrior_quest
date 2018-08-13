class Training
  include Rollable
  include Textable
  include Displayable
  extend Displayable
  include Validable
  include Logging

  TRAINING_TITLE = 'Entrainement'.freeze

  attr_reader :player, :teamates, :squires, :game

  def initialize(player, game)
    @player   = player
    @game = game
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
  end
end
