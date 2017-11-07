require_relative 'lib/game_class'

game = Game.new
lo = game.player
nain = game.teamates[0]
x = Character.new

Fightable.describe_combat_between(lo, nain)
