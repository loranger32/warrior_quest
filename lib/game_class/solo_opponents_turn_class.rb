class SoloOpponentsTurn < Turn
  def play
    opponents.each do |opponent|
      if opponent.stunt?
        print_message("#{opponent} est évanoui, il ne peut pas attaquer.")
      else
        Fightable.describe_combat_between(opponent, player)
      end
      wait_until_ready_to_go_on
    end

    unless game.end_condition?
      print_message("Fin du tour des écuyers, à vous !")
      wait_until_ready_to_go_on
    end
  end
end
