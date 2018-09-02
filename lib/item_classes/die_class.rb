require_relative '../system_classes/errors_class'
require_relative '../system_classes/bad_method_call_logging'

# Class for dies of all sorts
class Die
  
  
  attr_reader :faces

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
