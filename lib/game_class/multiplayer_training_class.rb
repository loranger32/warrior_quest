class MultiplayerTraining < TrainingSession

  TITLE = 'Entrainement en Equipe'.freeze
  ACTIONS = %w[1 2 3 4 s st s1 s2 s3 s4 h q].freeze
  VIEWING_ACTIONS = %w[s st s1 s2 s3 s4].freeze

  attr_reader :squires, :teamates

  def post_initialize(squires: set_four_squires, teamates: set_teamates)
    @squires  = squires
    @teamates = teamates
  end

  def play
    lauch_multiplayer_training_intro
    wait_until_ready_to_go_on

    until team_is_stunt? || all_squires_are_stunt? || one_squire_died? || 
      has_stopped_playing?
      successive_characters = PlayOrder.new(player, teamates, squires)
      successive_characters.order!

      play_turns(successive_characters)
    end

    print_end_training_message unless one_squire_died?
  end

  def lauch_multiplayer_training_intro
    clear_screen_with_title(title)
    show_team
    print_message(Textable::TrainingText.present_multiplayer_training)
    set_four_squires
    show_squires
    wait_until_ready_to_go_on
    clear_screen_with_title(title)
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

  def print_end_training_message
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

  def play_turns(successive_characters)
    successive_characters.each do |character|
      break if has_stopped_playing?
      break print_message(squire_passed_out(dead_squire)) if one_squire_died?

      if character == player || teamates.include?(character)
        MultiTeamTurn.new(player, squires, self, teamates: teamates,
                          current_character: character).play
      elsif squires.include?(character)
        MultiOpponentsTurn.new(player, squires, self, teamates: teamates,
                               current_character: character).play
      else
        raise CharacterIsNotPlayableError,
              "Character #{character} is not a playable one."
      end
    end
  end

  def process_player_choice(choice, character)
    case choice.downcase
      when '1'  then Fightable.describe_combat_between(character, squires[0])
      when '2'  then Fightable.describe_combat_between(character, squires[1])
      when '3'  then Fightable.describe_combat_between(character, squires[2])
      when '4'  then Fightable.describe_combat_between(character, squires[3])
      when 'h'  then Healable.describe_self_healing(player)
      when 's'  then display_player_stats
      when 'st' then display_team_stats
      when 's1' then show_individual_squire_stats(1)
      when 's2' then show_individual_squire_stats(2)
      when 's3' then show_individual_squire_stats(3)
      when 's4' then show_individual_squire_stats(4)
      when 'q'  then quit_playing
    end
  end

  def display_team_stats
    teamates.each(&:print_stats)
  end

  def end_condition?
    one_squire_died? || team_is_stunt? || all_squires_are_stunt? ||
        has_stopped_playing?
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
