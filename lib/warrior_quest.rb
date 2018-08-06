require 'bundler/setup'
require 'colorize'
require 'active_support/core_ext/string'
require_relative 'game_class/game_class'

game = Game.new
game.play

at_exit do 
  print_message("Merci d'avoir joué, et à bientôt dans la Quête du Chevalier !")
end
