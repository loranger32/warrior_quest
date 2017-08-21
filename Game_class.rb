require_relative 'character_class'
require_relative 'errors_class'
require_relative 'die_class'
require_relative 'rollable_module'

class Game
  attr_accessor :player, :teamates, :spaces

  include Rollable

  def initialize
    @player    = Character.new(name: 'laurent')
    @teamates  = {}
    @spaces    = []
  end

  def play
    puts 'Game orchestration engine not defined yet'
  end
end


game = Game.new
game.player.show_stats

