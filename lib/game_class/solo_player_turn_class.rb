class SoloPlayerTurn < Turn
  def play
    while true
      clear_screen_with_title(game.title)
      prompt(text.ask_for_action_with(player, opponents))

      choice = Validable.obtain_a_valid_input_from_list(game.actions)
      game.process_player_choice(choice)
  
      next wait_until_ready_to_go_on if \
        game.viewing_actions.include?(choice.downcase)

      print_message("Fin de votre action, à vos adversaires de jouer !") unless\
        game.end_condition?

      break
    end
  end
end
