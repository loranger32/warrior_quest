require 'bundler/setup'
require 'colorize'
require 'active_support/core_ext/string'
require_relative 'game_class/game_class'
require_relative 'text_modules/displayable_module'

game = Game.new
game.play

at_exit do 
  game.print_message("Merci d'avoir joué, et à bientôt dans la Quête du Chevalier !")
end
