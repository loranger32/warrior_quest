class PlayOrder
  attr_accessor :characters

  def initialize(player, teamates, opponents)
    @player    = player
    @teamates  = teamates
    @opponents = opponents
    @characters = [player, teamates, opponents].flatten
  end

  def order!
    characters.sort_by!(&:agility).reverse!
  end

  def each
    characters.each { |character| yield character }
  end
end
