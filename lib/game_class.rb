require_relative 'character_class'
require_relative 'warrior_class'
require_relative 'errors_class'
require_relative 'die_class'
require_relative 'rollable_module'
require_relative 'space_class'


class Game
  attr_accessor :player, :teamates, :spaces

  include Rollable

  def initialize
    @player        = Warrior.new(name: 'laurent')
    @teamates      = set_teamates
    @spaces        = set_spaces
    @current_space = @spaces[0]
  end

  def play
    puts 'Game orchestration engine not defined yet'
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
    3.times { team << Character.new }
    team
  end
end


game = Game.new

