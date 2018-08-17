# Abstract Class - Not To Be Initialized
class Turn
  include Displayable
  extend Displayable

  attr_accessor :player, :opponents
  attr_reader :game, :text

  def initialize(player, opponents, game, options = {})
    @player    = player
    @opponents = opponents
    @game      = game
    @text      = game.text
    post_initialize(options)
  end

  def post_initialize(_options)
    nil
  end

  def play
    raise "Method to be implemented by the concrete class"
  end
end
