require 'gutils'
require 'colorize'

require_relative 'character_class'
require_relative 'warrior_class'
require_relative 'dwarf_class'
require_relative 'errors_class'
require_relative 'die_class'
require_relative 'rollable_module'
require_relative 'space_class'
require_relative 'item_class'
require_relative 'textable_module'
require_relative 'displayable_module'
require_relative 'fightable_module'

class Game
  include Rollable
  include Textable
  include Displayable
  
  attr_accessor :player, :teamates, :spaces, :current_space

  def initialize
    @player        = Warrior.create_hero
    @teamates      = set_teamates
    @spaces        = set_spaces
    @current_space = @spaces[0]
  end

  def play
    puts 'Game orchestration engine not defined yet'
  end

  def ask_player_name
    prompt(Textable::Introduction.ask_name)
    player_name = gets.chomp
    while player_name.empty?
      prompt "Nom invalide, il ne peut pas être vide"
      prompt "Nouvel essai:"
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
    ask_player_name
    
    sleep(2)

    print_message(Textable::Introduction.greet_and_explain(player.name))
    
    sleep(2)

    print_message(Textable::Introduction.ask_player_what_to_do)
  end

  private

  def set_spaces
    spaces = []
    spaces << throne_room = Space.new(name: "Salle du trône",
                                      description: "Une magnifique salle,\
 dans laquelle se trouve concentrée toute la richesse de la région. Ceux qui \
 ont un avis qui compte se trouvent dans cette pièce. Parlez sagement !",
                                      group: 'Château')
    spaces << weaponery   = Space.new(name: "Salle d'armes",
                                      description: "une véritable salle aux\
 trésors pour ceux qui goûtent le maniement des armes. Vous y trouverez tout ce\
 dont vous pouvez rêver pour pourfendre, transpercer, assommer ou trancher vos\
 adversaires !",                      group: 'Château')
    spaces
  end

  def set_teamates
    team = []
    team << Dwarf.create_passipti
    team
  end
end
