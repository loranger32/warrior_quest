# A module for all sort of input validation - to be included primarily in the
# game_class, but can fit anywhere else
module Validable
  VALID_GAME_CHOICES = %w(n e l).freeze  

  def self.obtain_a_valid_name
    choice = gets.chomp
    until valid_name?(choice)
      prompt 'Nom invalide, nouvel essai:'
      choice = gets.chomp
    end
    choice
  end

  def self.valid_name?(choice)
    not_empty?(choice) && has_no_numbers?(choice) &&
      has_no_more_than_one_space_in_a_row?(choice) &&
      has_no_trailing_withe_space?(choice) && has_no_new_line?(choice)
  end

  def self.not_empty?(choice)
    !choice.empty? && choice.match?(/[a-zA-Z]/)
  end

  def self.has_no_numbers?(choice)
    !choice.match?(/\d+/)
  end

  def self.has_no_more_than_one_space_in_a_row?(choice)
    !choice.match?(/\s{2,}/)
  end

  def self.has_no_trailing_withe_space?(choice)
    !choice.match?(/\s\z/)
  end

  def self.has_no_new_line?(choice)
    !choice.match?(/\n/)
  end

  def self.valid_game_choice?(choice)
    VALID_GAME_CHOICES.include?(choice.downcase)
  end
end
