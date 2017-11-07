module Displayable
  def print_message(message)
    puts message.blue
  end

  def prompt(message)
    puts "=> #{message}".green
  end

  def clear_screen
    (system "clear") || (system 'cls')
  end
end
