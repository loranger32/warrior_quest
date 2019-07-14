require_relative '../system_classes/errors_class'

# Class for dices of all sorts
class Dice
  
  attr_reader :faces

  def self.generate_dices
    @dice_4 = new(4)
    @dice_6 = new
    @dice_8 = new(8)
    @dice_10 = new(10)
    @dice_12 = new(12)
    @dice_20 = new(20)
    @dice_100 = new(100)
  end

  def initialize(faces = 6)
    @faces = faces
  end

  def roll
    rand(1..faces)
  end

  def roll_times(number_of_rolls)
    raise CannotHaveZeroRollsError if number_of_rolls.zero?
    result = 0
    number_of_rolls.times do
      result += roll
    end
    result
  end
end
