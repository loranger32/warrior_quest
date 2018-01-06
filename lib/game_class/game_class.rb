require_relative '../character_classes/character_class'
require_relative '../character_classes/warrior_class'
require_relative '../character_classes/dwarf_class'
require_relative '../character_classes/elve_class'
require_relative '../character_classes/wizard_class'
require_relative '../system_classes/errors_class'
require_relative '../item_classes/die_class'
require_relative '../item_modules/rollable_module'
require_relative '../item_classes/space_class'
require_relative '../item_classes/item_class'
require_relative '../text_modules/textable_module'
require_relative '../text_modules/displayable_module'
require_relative '../text_modules/validable_module'
require_relative '../character_modules/fightable_module'
require_relative '../character_modules/healable_module'

# Main class of the game - sets up all the basic elements of the game
class Game
  include Rollable
  include Textable
  include Displayable
  include Validable

  attr_accessor :player, :teamates, :game_spaces, :current_space

  def initialize
    @player        = Warrior.create_hero
    @teamates      = set_teamates
    @game_spaces   = Space.spaces
    @current_space = @game_spaces[0]
  end

  def play
    launch_intro
    game_choice = retrieve_player_choice_of_game
  end

  def launch_intro
    clear_screen
    print_message(Textable::Introduction.welcome)
    sleep(2)
    ask_player_name
    clear_screen
    print_message(Textable::Introduction.greet_and_explain(player.name))
  end

  def ask_player_name
    prompt(Textable::Introduction.ask_name)
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
    choice = gets.chomp.downcase
    if choice == 'h'
      print_message(Textable::Introduction.name_rules)
    else
      prompt("Ok, choisissez votre nom:")
    end
  end

  def set_teamates
    team = []
    team << Dwarf.create_passipti
    team << Elve.create_toudou
    team << Wizard.create_hocus_pocus
    team
  end
end
