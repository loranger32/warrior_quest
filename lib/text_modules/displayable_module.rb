# A utils module to be included in game_class but defined separately for clarity
# In order to get its methods available in other modules, I've duplicated all
# instance methods in module methods - maybe not the more convenient way to do.
module Displayable
  SCREEN_WIDTH_13_INCHES = 125
  # titelize prints nicely formatted titles
  def self.titleize(title)
    title_size = title.size
    line = ("*" * (title_size + 10)).red.center(SCREEN_WIDTH_13_INCHES)
    title = title.red.center(SCREEN_WIDTH_13_INCHES)
    puts line
    puts title
    puts line
  end

  # print_message is for simply displaying text
  def self.print_message(message)
    puts "\n#{message}".blue
  end

  # print_error_message is for displaying error messages
  def self.print_error_message(message)
    puts "\n#{message}".yellow
  end

  # prompt is for retrieving user input
  def self.prompt(message)
    puts "\n=> #{message}".green
  end

  def self.clear_screen
    (system 'clear') || (system 'cls')
  end

  def self.clear_screen_with_title(title)
    clear_screen
    titleize(title)
  end

  def titleize(title)
    title_size = title.size
    line = ("*" * (title_size + 10)).red.center(SCREEN_WIDTH_13_INCHES)
    title = title.red.center(SCREEN_WIDTH_13_INCHES)
    puts line
    puts title
    puts line
    3.times { puts '' }
  end

  def print_message(message)
    puts "\n#{message}".blue
  end

  def print_error_message(message)
    puts "\n#{message}".yellow
  end

  def prompt(message)
    puts "\n=> #{message}".green
  end

  def clear_screen
    (system 'clear') || (system 'cls')
  end

  def clear_screen_with_title(title)
    clear_screen
    titleize(title)
  end
end
