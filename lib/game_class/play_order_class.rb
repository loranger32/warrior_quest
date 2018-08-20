class PlayOrder
  include Enumerable

  attr_accessor :characters

  def initialize(player, teamates, opponents)
    @player    = player
    @teamates  = teamates
    @opponents = opponents
    @characters = validate_and_arifyies_players(@player, @teamates, @opponents)
  end

  def order!
    characters.sort_by!(&:agility).reverse!
  end

  def each
    characters.each { |character| yield character }
  end

  private

  def validate_and_arifyies_players(player, teamates, opponents)
    players = [player, teamates, opponents].flatten
    raise ArgumentError, "All characters must respond to #agility" unless\
      players.all? { |player| player.respond_to?(:agility) }
    raise ArgumentError, 'First argument must be the Hero' unless\
      player.kind_of?(Warrior)
    raise ArgumentError,
          'Second argument must be array of Character subclasses' unless\
      teamates.is_a?(Array) && teamates.all? { |mate| mate.kind_of?(Character) }
    raise ArgumentError,
          'Third argument must be array of Character subclasses' unless\
      opponents.is_a?(Array) && opponents.all? do |opponent|
        opponent.kind_of?(Character)
      end
    players
  end
end
