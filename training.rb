require_relative 'lib/game_class'

game = Game.new

tou = game.teamates[1]

lo = game.player
p lo.hp
lo.reduce_hp(50)
p lo.hp

Healable.describe_healing_of(tou, lo)
