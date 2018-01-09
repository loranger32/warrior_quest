module Textable
  module TrainingText
    module_function

    def present_training
      <<~TRAINING_PRESENTATION

      Bienvenue dans le mode d'entraînement.

      Vous allez pouvoir vous entraîner aux combats, comme ils peuvent se\
 dérouler dans le jeu.

      Deux options sont disponibles: le combat solo ou le combat en équipe.

      Si c'est votre première partie, commencez avec le combat singulier.
      TRAINING_PRESENTATION
    end

    def ask_single_or_multiplayer_training
      <<~TRAINING_TYPE
      Quel type d'entrainement souhaitez vous:
      - solo ('s')
      - en équipe ('m')

      TRAINING_TYPE
    end

    def present_solo_training
      <<~PRESENT_SOLO_TRAINING
      Vous entrez dans la salle d'entrainement. Deux écuyers sont là pour vous\
 servir d'adversaire de combat. Allez-y doucement avec eux, ce sont des\
 étudiants !!!
      PRESENT_SOLO_TRAINING
    end

    def begin_solo_training
      <<~BEGIN_SOLO_TRAINING
      Bien ! Les écuyers sont en place pour le combat.
      BEGIN_SOLO_TRAINING
    end

    def ask_for_training_action_with(squires)
      <<~ASK_FOR_TRAINING_ACTION
      Que souhaitez-vous faire ?
      - attaquer #{squires.first} (#{squires.first.hp} points de vie) - tapez '1'
      - attaquer #{squires.last} (#{squires.last.hp} points de vie) - tapez '2'
      - vous soigner - tapez 'h'
      ASK_FOR_TRAINING_ACTION
    end
  end
end
