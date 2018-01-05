# A utils module to be included in game_class but defined separately for clarity
module Displayable
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
