require_relative 'Character_class'
require_relative 'Errors_class'
require_relative 'Die_class'
require_relative 'rollable_module'


class Game
  attr_accessor :player, :teamates, :spaces
  
  include Rollable

  def initialize
    player = nil
    teamates = nil
    spaces = nil
  end

  def play
    puts "Game orchestration engine not defined yet"
  end

end

