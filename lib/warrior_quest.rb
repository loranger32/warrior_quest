require 'bundler/setup'
require 'gutils'
require 'colorize'
require 'active_support/core_ext/string'
require_relative 'game_class/game_class'

game = Game.new

game.play
