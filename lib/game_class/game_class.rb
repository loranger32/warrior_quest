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

  attr_accessor :player, :teamates, :game_spaces, :current_space

  def initialize
    @player        = Warrior.create_hero
    @teamates      = set_teamates
    @game_spaces   = Space.spaces
    @current_space = @game_spaces[0]
  end

  def play
    ask_player_name
    launch_intro
  end

  def ask_player_name
    prompt(Textable::Introduction.ask_name)
    player_name = gets.chomp
    while player_name.empty?
      prompt 'Nom invalide, il ne peut pas être vide'
      prompt 'Nouvel essai:'
      player_name = gets.chomp
    end
    player.name = player_name
  end

  def go_to(other_space)
    self.current_space = other_space
    puts "Vous et votre équipe allez à #{other_space}"
  end

  def launch_intro
    clear_screen
    print_message(Textable::Introduction.welcome)
    sleep(2)

    ask_player_name
    print_message(Textable::Introduction.greet_and_explain(player.name))
    print_message(Textable::Introduction.ask_player_what_to_do)
  end

  def get_player_choice_of_game
    choice = gets.chomp

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
