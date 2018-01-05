require 'pry'
require 'bundler/setup'
require_relative 'lib/warrior_quest'

game = Game.new
game.launch_intro
binding.pry
puts "end"
