class MultiTeamTurn < Turn

  attr_reader :teamates, :current_character

  def post_initialize(teamates: teamates, current_character: character)
    @teamates = teamates
    @current_character = current_character
  end

  def play
    if current_character.stunt?
      print_message("#{current_character} est assommé, il ne peut pas jouer.")
      wait_until_ready_to_go_on
      return
    end

    while true
      clear_screen_with_title(game.title)
      print_message("Au tour de #{current_character} de jouer.")
      game.display_summarized_team_hp
      action = process_action
  
      wait_until_ready_to_go_on unless game.has_stopped_playing?
      
      next if game.viewing_actions.include?(action.downcase)

      print_message("Fin du tour de #{current_character}, au suivant!") unless\
        game.end_condition?

      break
    end
  end

  private

  def process_action
    prompt(text.ask_for_team_action_with(player, teamates, opponents))
    choice = Validable.obtain_a_valid_input_from_list(game.actions)
    game.process_player_choice(choice, current_character)
    choice
  end
end
