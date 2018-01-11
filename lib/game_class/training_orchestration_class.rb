class Training
  SINGLE_TRAINING_ACTIONS = %w(1 2 h).freeze

  def play
    clear_screen_with_title(TRAINING_TITLE)
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
    teamates.each { |teamate| puts "- #{teamate}".blue }
  end

  def show_squires
    print_message("Vos adversaires d'entrainement sont:")
    squires.each { |squire| puts "- #{squire}".blue }
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
    clear_screen_with_title(MULTI_TRAINING_TITLE)
    show_squires
  end

  def single_player_fight
    launch_single_player_training_intro
    print_message(Textable::TrainingText.begin_solo_training)
    while player_is_not_stunt && squires_are_not_stunt
      player_turn
      if one_squire_died?
        print_message(squire_passed_out(dead_squire))
        break
      end
      wait_until_ready_to_go_on
      squires_turn
    end
    unless one_squire_died?
      print_message("L'entrainement est terminé, les écuyers sont assomés.")
    end
  end

  def launch_single_player_training_intro
    set_two_squires
    clear_screen_with_title(SOLO_TRAINING_TITLE)
    print_message(Textable::TrainingText.present_solo_training)
    show_squires
    show_squires_stats
    wait_until_ready_to_go_on
    clear_screen_with_title(SOLO_TRAINING_TITLE)
  end

  def player_turn
    clear_screen_with_title(SOLO_TRAINING_TITLE)
    prompt(Textable::TrainingText.ask_for_training_action_with(squires))
    choice = Validable.obtain_a_valid_input_from_list(SINGLE_TRAINING_ACTIONS)
    case choice
    when '1' then Fightable.describe_combat_between(player, squires.first)
    when '2' then Fightable.describe_combat_between(player, squires.last)
    when 'h' then Healable.describe_self_healing(player)
    end
    print_message("Fin du tour, aux écuyers de jouer !") unless one_squire_died?
  end

  def squires_turn
    squires.each do |squire|
      if squire.stunt?
        print_message("#{squire} est évanoui, il ne peut pas attaquer.")
      else
        Fightable.describe_combat_between(squire, player)
      end
      wait_until_ready_to_go_on
    end
    unless !squires_are_not_stunt
      print_message("Fin du tour des écuyers, à vous !")
    end
  end

  def wait_until_ready_to_go_on
    prompt("Prêts ? (appuer sur une touche pour continuer)")
    gets.chomp
  end

  def player_is_not_stunt
    !player.stunt?
  end

  def squires_are_not_stunt
    !squires.all? { |squire| squire.stunt? }
  end

  def squire_passed_out(squire)
    print_message(Textable::TrainingText.too_bad_a_squire_passe_out(squire))
  end

  def one_squire_died?
    squires.any? { |squire| squire.dead? }
  end

  def dead_squire
    squires.find { |squire| squire.dead? }
  end
end
