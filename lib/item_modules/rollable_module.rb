require_relative '../item_classes/dice_class'

# Module to allow players and characters to roll dices - to be included in
# relevant characters class
module Rollable
  BAG_OF_DICES = { dice_of_4: Dice.new(4),
                  dice_of_6: Dice.new,
                  dice_of_8: Dice.new(8),
                  dice_of_10: Dice.new(10),
                  dice_of_12: Dice.new(12),
                  dice_of_20: Dice.new(20),
                  dice_of_100: Dice.new(100) }.freeze

  def throw_dice_of_4_times(number_of_rolls)
    BAG_OF_DICES[:dice_of_4].roll_times(number_of_rolls)
  end

  def throw_dice_of_6_times(number_of_rolls)
    BAG_OF_DICES[:dice_of_6].roll_times(number_of_rolls)
  end

  def throw_dice_of_8_times(number_of_rolls)
    BAG_OF_DICES[:dice_of_8].roll_times(number_of_rolls)
  end

  def throw_dice_of_10_times(number_of_rolls)
    BAG_OF_DICES[:dice_of_10].roll_times(number_of_rolls)
  end

  def throw_dice_of_12_times(number_of_rolls)
    BAG_OF_DICES[:dice_of_12].roll_times(number_of_rolls)
  end

  def throw_dice_of_20_times(number_of_rolls)
    BAG_OF_DICES[:dice_of_20].roll_times(number_of_rolls)
  end

  def throw_dice_of_100_times(number_of_rolls)
    BAG_OF_DICES[:dice_of_100].roll_times(number_of_rolls)
  end
end
