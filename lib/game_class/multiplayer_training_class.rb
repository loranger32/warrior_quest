class MultiplayerTraining

  MULTI_TRAINING_TITLE = 'Entrainement en Equipe'.freeze
  MULTIPLAYER_TRANING_ACTIONS = %w[1 2 3 4 s s1 s2 s3 s4 h q].freeze
  MULTIPLAYER_TRANING_VIEWING_ACTIONS = %w[s s1 s2 s3 s4].freeze

  attr_reader :squires, :teamates

  def post_initialize(squires: set_four_squires, teamates: set_teamates)
    @squires  = squires
    @teamates = teamates
  end

  def play
    lauch_multiplayer_training_intro
    wait_until_ready_to_go_on

    until team_is_stunt? || all_squires_are_stunt?
      TeamTurn.new(player, teamates, squires, self).play

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

  private

  def set_teamates
    team = []
    team << Dwarf.create_passipti
    team << Elve.create_toudou
    team << Wizard.create_hocus_pocus
    team
  end

end
