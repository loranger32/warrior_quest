require_relative 'lib/game_class'

game = Game.new

game.teamates.each do |mate|
  puts mate.show_stats
end
