require 'bundler/setup'
require 'colorize'
require 'active_support/core_ext/string'
require_relative 'game_class/game_class'
require_relative 'text_modules/displayable_module'

game = Game.new
<<<<<<< HEAD
game.play

at_exit do 
  game.print_message("Merci d'avoir joué, et à bientôt dans la Quête du Chevalier !")
=======
game.stop
game.play

at_exit do 
  print_message("Merci d'avoir joué, et à bientôt dans la Quête du Chevalier !")
>>>>>>> eb983d1f4972346e689c445763aaec345f794b16
end
