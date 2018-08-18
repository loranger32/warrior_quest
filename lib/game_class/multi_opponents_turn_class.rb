class MultiOpponentsTurn < Turn
  attr_reader :teamates, :current_character
  
  def post_initialize(teamates: teamates, current_character: character)
    @teamates = teamates
    @current_character = current_character
  end

  def play
    if current_character.stunt?
      print_message("#{current_character} est évanoui, il ne peut pas jouer.")
    else
      opponent = choose_opponent
      Fightable.describe_combat_between(current_character, opponent)
    end
    
    wait_until_ready_to_go_on

    unless game.end_condition?
      print_message("Fin du tour de #{current_character}, au suivant !")
      wait_until_ready_to_go_on
    end
  end

  private

  def choose_opponent
    while true
      opponent = (teamates + [player]).flatten.sample
      break opponent unless opponent.stunt?
    end
  end
end
