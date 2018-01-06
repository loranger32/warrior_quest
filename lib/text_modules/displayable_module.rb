# A utils module to be included in game_class but defined separately for clarity
# In order to get its methods available in other modules, I've duplicated all
# instance methods in module methods - maybe not the more convenient way to do.
module Displayable
  # print is for simply displaying text
  def self.print_message(message)
    puts.message.blue
  end

  # prompt is for retrieving user input
  def self.prompt(message)
    puts "=> #{message}".green
  end

  def self.clear_screen
    (system 'clear') || (system 'cls')
  end

  def print_message(message)
    puts message.blue
  end

  def prompt(message)
    puts "=> #{message}".green
  end

  def clear_screen
    (system 'clear') || (system 'cls')
  end
end
