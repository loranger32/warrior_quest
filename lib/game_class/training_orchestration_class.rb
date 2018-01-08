class Training
  def play
    titleize "Welcome to training !"
    show_team
    show_bad_guys
    training_type = ask_for_single_or_multiplayer_fight
    case training_type
    when :multi  then multiplayer_fight
    when :single then single_player_fight
    end
  end

  def show_team
    print_message("Your team is:")
    teamates.each do |teamate| 
      print "- ".blue
      print_message teamate.to_s
    end
  end

  def ask_for_single_or_multiplayer_fight
    
  end

  def multiplayer_fight
    
  end

  def single_player_fight
    
  end
end
