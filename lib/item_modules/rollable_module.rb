require_relative '../item_classes/die_class'

module Rollable
  BAG_OF_DIES = { die_of_4: Die.new(4),
                  die_of_6: Die.new,
                  die_of_8: Die.new(8),
                  die_of_10: Die.new(10),
                  die_of_12: Die.new(12),
                  die_of_20: Die.new(20),
                  die_of_100: Die.new(100) }.freeze

  def throw_die_of_4_times(number_of_rolls)
    BAG_OF_DIES[:die_of_4].roll_times(number_of_rolls)
  end

  def throw_die_of_6_times(number_of_rolls)
    BAG_OF_DIES[:die_of_6].roll_times(number_of_rolls)
  end

  def throw_die_of_8_times(number_of_rolls)
    BAG_OF_DIES[:die_of_8].roll_times(number_of_rolls)
  end

  def throw_die_of_10_times(number_of_rolls)
    BAG_OF_DIES[:die_of_10].roll_times(number_of_rolls)
  end

  def throw_die_of_12_times(number_of_rolls)
    BAG_OF_DIES[:die_of_12].roll_times(number_of_rolls)
  end

  def throw_die_of_20_times(number_of_rolls)
    BAG_OF_DIES[:die_of_20].roll_times(number_of_rolls)
  end

  def throw_die_of_100_times(number_of_rolls)
    BAG_OF_DIES[:die_of_100].roll_times(number_of_rolls)
  end
end

