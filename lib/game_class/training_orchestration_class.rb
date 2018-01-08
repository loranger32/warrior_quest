class Training
  def play
    clear_screen
    titleize "Welcome to training !"
    present_training
    #show_bad_guys
    training_type = ask_for_single_or_multiplayer_fight
    case training_type
    when :multi  then multiplayer_fight
    when :single then single_player_fight
    end
  end

  def present_training
    print_message(Textable::TrainingText.present_training)
    show_team
  end

  def show_team
    print_message("Votre équipe est composée de:")
    teamates.each do |teamate| 
      print "- ".blue
      print_message teamate.to_s
    end
    puts
  end

  def ask_for_single_or_multiplayer_fight
    prompt(Textable::TrainingText.ask_single_or_multiplayer_training)
  end

  def multiplayer_fight
    
  end

  def single_player_fight
    
  end
end
