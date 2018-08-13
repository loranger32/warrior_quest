class Training
  SINGLE_TRAINING_ACTIONS = %w[1 2 h s s1 s2 q].freeze
  SINGLE_TRAINING_VIEWING_ACTIONS = %w[s s1 s2].freeze
  SINGLE_TRAINING_WEAPONS = {barehands: 'm', sword: 'e', axe: 'h',
                             shortsword: 'd', spear: 'l', staff: 'b'}.freeze

  MULTIPLAYER_TRANING_ACTIONS = %w[1 2 3 4 s s1 s2 s3 s4 h q].freeze
  MULTIPLAYER_TRANING_VIEWING_ACTIONS = %w[s s1 s2 s3 s4].freeze

  ####### Common Methods To Both Single And Multiplayer Training ###############

  def play
    clear_screen_with_title(TRAINING_TITLE)
    present_training
    loop do
      play_single_or_multiplayer_training
      break if has_left_training?

      if play_again?
        player.restore_max_hp
        display_new_training
      else
        break
      end
    end

    game.return_from_training
  end

  def present_training
    print_message(Textable::TrainingText.present_training)
  end

  def play_single_or_multiplayer_training
    training_type = ask_for_single_or_multiplayer_fight
    case training_type
    when 's' then single_player_fight
    when 'm' then multiplayer_fight
    when 'q' then quit_training
    end
  end

  def play_again?
    prompt("Souhaitez-vous refaire un combat d'entrainement ? ('o', 'n')")
    choice = Validable.obtain_a_valid_input_from_list(['o', 'n'])
    choice == 'o'
  end

  def display_new_training
    clear_screen_with_title(TRAINING_TITLE)
    print_message("C'est parti pour une nouvelle séance d'entrainement !")
  end

  def ask_for_single_or_multiplayer_fight
    prompt(Textable::TrainingText.ask_single_or_multiplayer_training)
    Validable.obtain_a_valid_input_from_list(['s', 'm', 'q'])
  end

  def quit_training
    @training = false
  end

  def quit_playing
    @playing = false
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

    squire.print_stats
  end

  def show_squires_stats
    print_message("Leurs statistiques sont:")
    squires.each { |squire| print_message(squire.stats_display) }
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

  def display_player_stats
    player.print_stats
  end

  ####### Single Player Training Methods #######################################

  def single_player_fight
    launch_single_player_training_intro
    player_chooses_weapon
    wait_until_ready_to_go_on
    
    while player_is_not_stunt? && !all_squires_are_stunt?
      single_player_turn
      if one_squire_died?
        print_message(squire_passed_out(dead_squire))
        break
      end

      break if has_stopped_playing?

      wait_until_ready_to_go_on
      single_player_training_squires_turn
    end
    unless one_squire_died?
      if has_stopped_playing?
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

  def launch_single_player_training_intro
    set_two_squires
    clear_screen_with_title(SOLO_TRAINING_TITLE)
    print_message(Textable::TrainingText.present_solo_training)
    show_squires
    wait_until_ready_to_go_on
    clear_screen_with_title(SOLO_TRAINING_TITLE)
    print_message(Textable::TrainingText.begin_solo_training)
  end

  def player_chooses_weapon
    print_message(Textable::TrainingText.ask_which_weapon_to_use)
    weapon_choice = Validable.obtain_a_valid_input_from_list(SINGLE_TRAINING_WEAPONS.values)
    weapon = equip_player_with_weapon(player, weapon_choice)
    print_message("Ok, vous combatterez avec : #{weapon.name}")
  end

  def equip_player_with_weapon(player, weapon_choice)
    weapon = case weapon_choice
             when SINGLE_TRAINING_WEAPONS[:barehands]  then BareHands.new
             when SINGLE_TRAINING_WEAPONS[:sword]      then Sword.new
             when SINGLE_TRAINING_WEAPONS[:axe]        then Axe.new
             when SINGLE_TRAINING_WEAPONS[:shortsword] then ShortSword.new
             when SINGLE_TRAINING_WEAPONS[:spear]      then Spear.new
             when SINGLE_TRAINING_WEAPONS[:staff]      then Staff.new
             end

    player.equip_weapon(weapon)
    weapon
  end

  def single_player_turn
    while true
      clear_screen_with_title(SOLO_TRAINING_TITLE)
      prompt(Textable::TrainingText.ask_for_training_action_with(player,
                                                                 squires))

      choice = Validable.obtain_a_valid_input_from_list(SINGLE_TRAINING_ACTIONS)
      process_player_choice(choice)
  
      next wait_until_ready_to_go_on if \
        SINGLE_TRAINING_VIEWING_ACTIONS.include?(choice.downcase)

      unless one_squire_died? || player_is_stunt? || all_squires_are_stunt? ||
        has_stopped_playing?
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
      when 'q'  then quit_playing
    end
  end

  ####### Multiplayer training Methods ##########################################

  def multiplayer_fight
    lauch_multiplayer_training_intro
    wait_until_ready_to_go_on

    until team_is_stunt? || all_squires_are_stunt?
      TeamTurn.new(player, teamates, squires).play

      if one_squire_died?
        print_message(squire_passed_out(dead_squire))
        break
      end

      break if has_stopped_playing?

      wait_until_ready_to_go_on
      multiplayer_training_squires_turn
    end
    unless one_squire_died?
      if has_stopped_playing?
        print_message(Textable::TrainingText.quit_multiplayer_training)
      elsif team_is_stunt?
        print_message(Textable::TrainingText.team_is_stunt)
      elsif all_squires_are_stunt?
        print_message(Textable::TrainingText.squires_are_all_stunt)
      else
        print_message(Textable::TrainingText.unexpected_training_ending)
      end
    end   
  end

  def lauch_multiplayer_training_intro
    clear_screen_with_title(MULTI_TRAINING_TITLE)
    show_team
    print_message(Textable::TrainingText.present_multiplayer_training)
    set_four_squires
    show_squires
    wait_until_ready_to_go_on
    clear_screen_with_title(MULTI_TRAINING_TITLE)
    print_message(Textable::TrainingText.begin_multiplayer_training)
  end

  def show_team
    print_message("Votre équipe est composée de:")
    teamates.each { |teamate| puts "- #{teamate} - #{teamate.type.upcase}".blue }
  end

  def show_teammates_stats
    teamates.each { |teamate| teamate.print_stats }
  end

  def team_is_stunt?
    teamates.all?(&:stunt?)
  end

  def multiplayer_training_player_turn
    while true
      clear_screen_with_title(MULTIPLAYER_TRAINING_TITLE)
      prompt(Textable::TrainingText.ask_for_training_action_with(player,
                                                                 squires))

      choice = Validable.obtain_a_valid_input_from_list(SINGLE_TRAINING_ACTIONS)
      process_player_choice(choice)
  
      next wait_until_ready_to_go_on if \
        SINGLE_TRAINING_VIEWING_ACTIONS.include?(choice.downcase)

      unless one_squire_died? || player_is_stunt? || all_squires_are_stunt? ||
        has_stopped_playing?
        print_message("Fin de votre action, aux écuyers de jouer !")
      end

      break
    end
  end

  def multiplayer_training_squires_turn
    
  end
end
