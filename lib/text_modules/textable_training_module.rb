module Textable
  module TrainingText
    def self.present_training
      <<-TRAINING_PRESENTATION.strip_heredoc

      Bienvenue dans le mode d'entraînement.

      Vous allez pouvoir vous entraîner aux combats, comme ils peuvent se
      dérouler dans le jeu.

      Deux options sont disponibles: le combat solo ou le combat en équipe.

      Si c'est votre première partie, commencez avec le combat singulier.
      TRAINING_PRESENTATION
    end

    def self.ask_single_or_multiplayer_training
      <<-TRAINING_TYPE.strip_heredoc
      Quel type d'entrainement souhaitez vous:
      - solo ('s')
      - en équipe ('m')

      TRAINING_TYPE
    end
  end
end
