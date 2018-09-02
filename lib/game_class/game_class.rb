<<<<<<< HEAD
require 'pry'

=======
>>>>>>> eb983d1f4972346e689c445763aaec345f794b16
require_relative '../system_classes/bad_method_call_logging'
require_relative '../system_classes/errors_class'
require_relative '../character_classes/character_class'
require_relative '../character_classes/warrior_class'
require_relative '../character_classes/dwarf_class'
require_relative '../character_classes/elve_class'
require_relative '../character_classes/wizard_class'
require_relative '../character_classes/squire_class'
require_relative '../item_classes/die_class'
require_relative '../item_modules/rollable_module'
require_relative '../item_classes/space_class'
require_relative '../item_classes/item_class'
require_relative '../text_modules/textable_introduction_module'
require_relative '../text_modules/textable_training_module'
require_relative '../text_modules/displayable_module'
require_relative '../text_modules/validable_module'
require_relative '../character_modules/fightable_module'
require_relative '../character_modules/healable_module'
require_relative 'game_training_class'
<<<<<<< HEAD
require_relative 'training_session_class'
require_relative 'multiplayer_training_class'
require_relative 'single_player_training_class'
require_relative 'turn_class'
require_relative 'solo_player_turn_class'
require_relative 'solo_opponents_turn_class'
require_relative 'multi_team_turn_class'
require_relative 'multi_opponents_turn_class'
require_relative 'play_order_class'
=======
require_relative 'training_orchestration_class'
>>>>>>> eb983d1f4972346e689c445763aaec345f794b16

# Main class of the game - sets up all the basic elements of the game
class Game
  include Rollable
  include Textable
  include Displayable
<<<<<<< HEAD
  extend Displayable
=======
>>>>>>> eb983d1f4972346e689c445763aaec345f794b16
  include Validable
  include Logging

  GAME_TITLE = 'La Quête du Chevalier'.freeze

  attr_accessor :player, :teamates, :game_spaces, :current_space

  def initialize
    @player        = Warrior.create_hero
    @teamates      = set_teamates
    @game_spaces   = Space.spaces
    @current_space = @game_spaces[0]
    @playing = true
  end

  def play
<<<<<<< HEAD
    while @playing
      launch_intro
      choose_game_type
    end
  end

  def launch_intro
    clear_screen
    titleize(GAME_TITLE)
    print_message(Textable::Introduction.welcome)
    ask_player_name
    clear_screen
    titleize(GAME_TITLE)
    print_message(Textable::Introduction.greet_and_explain(player.name))
  end

=======
    launch_intro
    choose_game_type
  end

  def launch_intro
    clear_screen
    titleize(GAME_TITLE)
    print_message(Textable::Introduction.welcome)
    #sleep(2)
    ask_player_name
    clear_screen
    titleize(GAME_TITLE)
    print_message(Textable::Introduction.greet_and_explain(player.name))
  end

>>>>>>> eb983d1f4972346e689c445763aaec345f794b16
  def return_from_training
    clear_screen_with_title(GAME_TITLE)
    print_message("Vous êtes de retour de l'entrainement !")
    choose_game_type
  end

  def choose_game_type
    game_choice = retrieve_player_choice_of_game
    case game_choice
    when 'n' then launch_game(player)
    when 'e' then launch_training(player, self)
    when 'l' then restore_game
<<<<<<< HEAD
    when 'q' then quit_game
=======
>>>>>>> eb983d1f4972346e689c445763aaec345f794b16
    end
  end

  def launch_training(player, game)
    training = Training.new(player, game)
    training.play
  end

  def ask_player_name
    print_message(Textable::Introduction.ask_name)
<<<<<<< HEAD
=======
    prompt('Voulez-vous les voir ? (\'o\', \'n\')')
>>>>>>> eb983d1f4972346e689c445763aaec345f794b16
    show_or_skip_help
    player.name = Validable.obtain_a_valid_name
  end

  def go_to(other_space)
    self.current_space = other_space
    puts "Vous et votre équipe allez à #{other_space}"
  end

  def retrieve_player_choice_of_game
    prompt(Textable::Introduction.ask_player_what_to_do)
    Validable.obtain_a_valid_game_choice
  end

  private

  def show_or_skip_help
<<<<<<< HEAD
    prompt('Voulez-vous les voir ? (\'o\', \'n\')')
=======
>>>>>>> eb983d1f4972346e689c445763aaec345f794b16
    choice = gets.chomp.downcase
    if choice == 'o'
      print_message(Textable::Introduction.name_rules)
    end
    prompt("Ok, choisissez votre nom:")
  end

  def set_teamates
    team = []
    team << Dwarf.create_passipti
    team << Elve.create_toudou
    team << Wizard.create_hocus_pocus
    team
  end

  def quit_game
    @playing = false
  end
end
