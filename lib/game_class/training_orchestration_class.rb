class Training
  def play
    clear_screen
    titleize "Bienvenue à l'entrainement !"
    present_training
    training_type = ask_for_single_or_multiplayer_fight
    case training_type
    when 's' then single_player_fight
    when 'm' then multiplayer_fight
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
      print_message(teamate.to_s)
    end
    puts
  end

  def show_squires
    print_message("Vos adversaires d'entrainement sont:")
    squires.each do |squire| 
      print "- ".blue
      print_message(squire.to_s)
    end
    puts
  end

  def show_squires_stats
    print_message("Leurs statistiques sont:")
    squires.each { |squire| print_message(squire.stats_display) }
  end

  def ask_for_single_or_multiplayer_fight
    prompt(Textable::TrainingText.ask_single_or_multiplayer_training)
    Validable.obtain_a_valid_input_from_list(['s', 'm'])
  end

  def multiplayer_fight
    set_four_squires
    clear_screen
    titleize('Entrainement en équipe')
    show_squires
  end

  def single_player_fight
    launch_single_player_training_intro
    print_message(Textable::TrainingText.begin_solo_training)
    while player_is_not_stunt && squires_are_not_stunt
      prompt(Textable::TrainingText.ask_for_training_action_with(squires))
      break
    end
    puts "Fini!"
  end

  def launch_single_player_training_intro
    set_two_squires
    clear_screen
    titleize('Entrainement solo')
    print_message(Textable::TrainingText.present_solo_training)
    show_squires
    show_squires_stats
    wait_until_ready_to_go_on
  end

  def wait_until_ready_to_go_on
    prompt("Prêts ? (appuer sur une touche pour continuer)")
    gets.chomp
  end

  def player_is_not_stunt
    !player.stunt?
  end

  def squires_are_not_stunt
    squires.none? { |squire| squire.stunt? }
  end


end
