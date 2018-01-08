# A module for all sort of input validation - only module level methods
module Validable
  VALID_GAME_CHOICES = %w(n e l).freeze

# ========== Generic validation mechanism ==========

  def self.obtain_a_valid_input_from_list(valid_choices_list)
    choice = gets.chomp
    until valid_game_choice?(choice, valid_choices_list)
      Displayable.print_error_message("Choix invalide !")
      Displayable.print_error_message("Les choix possibles sont:")
      Displayable.print_error_message(valid_choices_list.join(', ') + '.')
      Displayable.prompt("Quel est votre choix ?")
      choice = gets.chomp
    end
    choice
  end

  def self.valid_choice?(choice, valid_choice_list)
    valid_choices_list?.include?(choice.downcase)
  end

# ========== Name validation ===========

  def self.obtain_a_valid_name
    choice = gets.chomp
    until valid_name?(choice)
      Displayable.print_error_message('Nom invalide !')
      Displayable.prompt(Textable::Introduction.ask_name)
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

# ========== Game choice validation ==========

  def self.obtain_a_valid_game_choice
    choice = gets.chomp
    until valid_game_choice?(choice)
      Displayable.print_error_message("Choix invalide !")
      Displayable.print_error_message("Les choix possibles sont:")
      Displayable.print_error_message(VALID_GAME_CHOICES.join(', ') + '.')
      Displayable.prompt(Textable::Introduction.ask_player_what_to_do)
      choice = gets.chomp
    end
    choice
  end

  def self.valid_game_choice?(choice)
    VALID_GAME_CHOICES.include?(choice.downcase)
  end
end



