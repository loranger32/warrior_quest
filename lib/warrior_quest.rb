require 'bundler/setup'
require 'gutils'
require 'colorize'
require_relative 'game_class/game_class'

game = Game.new

game.play
