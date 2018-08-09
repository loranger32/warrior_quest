class Training
  SINGLE_TRAINING_ACTIONS = %w[1 2 h s s1 s2 q].freeze
  SINGLE_TRAINING_VIEWING_ACTIONS = %w[s s1 s2].freeze
  MULTIPLAYER_TRANING_ACTIONS = %w[1 2 3 4 s s1 s2 s3 s4 h q].freeze
  MULTIPLAYER_TRANING_VIEWING_ACTIONS = %w[s s1 s2 s3 s4].freeze

  ####### Common Methods To Both Single And Multiplayer Training ###############

  def play
    clear_screen_with_title(TRAINING_TITLE)
    present_training
    loop do
      play_single_or_multiplayer_training
      break if @playing == false

      if play_again?
        player.restore_max_hp
        display_new_training
      else
        break
      end
    end

    game.return_from_training
  end

  def display_player_stats
    puts player.stats_display
  end

  def play_single_or_multiplayer_training
    training_type = ask_for_single_or_multiplayer_fight
    case training_type
    when 's' then single_player_fight
    when 'm' then multiplayer_fight
    when 'q' then quit_training
    end
  end

  def present_training
    print_message(Textable::TrainingText.present_training)
    show_team
  end

  def display_new_training
    clear_screen_with_title(TRAINING_TITLE)
    print_message("C'est parti pour une nouvelle séance d'entrainement !")
  end

  def show_squires
    print_message("Vos adversaires d'entrainement sont:")
    squires.each { |squire| puts "- #{squire}".blue }
  end

  def show_individual_squire_stats(squire_number)
    squire = case squire_number
             when 1 then squires[0]
             when 2 then squires[1]
             when 3 then squires[2]
             when 4 then squires[3]
             end

    puts squire.stats_display
  end

  def show_second_squire_stats
    puts squires.last.stats_display
  end

  def show_squires_stats
    print_message("Leurs statistiques sont:")
    squires.each { |squire| print_message(squire.stats_display) }
  end

  def ask_for_single_or_multiplayer_fight
    prompt(Textable::TrainingText.ask_single_or_multiplayer_training)
    Validable.obtain_a_valid_input_from_list(['s', 'm', 'q'])
  end

  def player_is_not_stunt?
    !player.stunt?
  end

  def player_is_stunt?
    player.stunt?
  end

  def all_squires_are_stunt?
    squires.all?(&:stunt?)
  end

  def squire_passed_out(squire)
    print_message(Textable::TrainingText.too_bad_a_squire_passe_out(squire))
  end

  def one_squire_died?
    squires.any?(&:dead?)
  end

  def dead_squire
    squires.find(&:dead?)
  end

  def play_again?
    prompt("Souhaitez-vous refaire un combat d'entrainement ? ('o', 'n')")
    choice = Validable.obtain_a_valid_input_from_list(['o', 'n'])
    choice == 'o'
  end

  def quit_training
    @playing = false
  end

  ####### Single Player Training Methods #######################################

  def launch_single_player_training_intro
    set_two_squires
    clear_screen_with_title(SOLO_TRAINING_TITLE)
    print_message(Textable::TrainingText.present_solo_training)
    show_squires
    wait_until_ready_to_go_on
    clear_screen_with_title(SOLO_TRAINING_TITLE)
    print_message(Textable::TrainingText.begin_solo_training)
  end

  def single_player_fight
    launch_single_player_training_intro
    
    while player_is_not_stunt? && !all_squires_are_stunt?
      single_player_turn
      if one_squire_died?
        print_message(squire_passed_out(dead_squire))
        break
      end

      break if @playing == false

      wait_until_ready_to_go_on
      single_player_training_squires_turn
    end
    unless one_squire_died?
      if @playing == false
        print_message(Textable::TrainingText.quit_solo_training)
      elsif player_is_stunt?
        print_message(Textable::TrainingText.player_is_stunt)
      elsif all_squires_are_stunt?
        print_message(Textable::TrainingText.squires_are_all_stunt)
      else
        print_message(Textable::TrainingText.unexpected_training_ending)
      end
    end
  end

  def single_player_turn
    while true
      clear_screen_with_title(SOLO_TRAINING_TITLE)
      prompt(Textable::TrainingText.ask_for_training_action_with(player, squires))

      choice = Validable.obtain_a_valid_input_from_list(SINGLE_TRAINING_ACTIONS)
      process_player_choice(choice)

      
      next wait_until_ready_to_go_on if SINGLE_TRAINING_VIEWING_ACTIONS.include?(choice.downcase)

      unless one_squire_died? || player_is_stunt? || all_squires_are_stunt? ||
        @playing == false
        print_message("Fin de votre action, aux écuyers de jouer !")
      end

      break
    end
  end

  def single_player_training_squires_turn
    squires.each do |squire|
      if squire.stunt?
        print_message("#{squire} est évanoui, il ne peut pas attaquer.")
      else
        Fightable.describe_combat_between(squire, player)
      end
      wait_until_ready_to_go_on
    end
    unless all_squires_are_stunt?
      print_message("Fin du tour des écuyers, à vous !")
      wait_until_ready_to_go_on
    end
  end

  def process_player_choice(choice)
    case choice.downcase
      when '1'  then Fightable.describe_combat_between(player, squires.first)
      when '2'  then Fightable.describe_combat_between(player, squires.last)
      when 'h'  then Healable.describe_self_healing(player)
      when 's'  then display_player_stats
      when 's1' then show_individual_squire_stats(1)
      when 's2' then show_individual_squire_stats(2)
      when 'q'  then quit_training
    end
  end

  ####### Multiplayer raining Methods ##########################################

  def multiplayer_fight
    clear_screen_with_title(MULTI_TRAINING_TITLE)
    show_team
    display_player_stats
    show_teammates_stats
    set_four_squires
    show_squires
    show_squires_stats
  end

  def show_team
    print_message("Votre équipe est composée de:")
    teamates.each { |teamate| puts "- #{teamate}".blue }
  end

  def show_teammates_stats
    teamates.each { |teamate| puts teamate.stats_display }
  end

end
