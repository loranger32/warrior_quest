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
      - solo - tapez 's'
      - en équipe - tapez 'm'
      - retour au menu principal - tapez 'q'
      TRAINING_TYPE
    end

    def present_solo_training
      <<~PRESENT_SOLO_TRAINING
      Vous entrez dans la salle d'entrainement. Deux écuyers sont là pour vous\
 servir d'adversaire de combat. Allez-y doucement avec eux, ce sont des\
 étudiants !!!

      Le combat s'arrêtera lorsque soit vous, soit les deux écuyers\
 descenderont en dessous de 20 points de vie. Cela correspond à être bien sonné!
      PRESENT_SOLO_TRAINING
    end

    def begin_solo_training
      <<~BEGIN_SOLO_TRAINING
      Bien ! Les écuyers sont en place pour le combat.
      BEGIN_SOLO_TRAINING
    end

    def ask_for_training_action_with(player, squires)
      <<~ASK_FOR_TRAINING_ACTION
      Que souhaitez-vous faire ?
      - attaquer #{squires.first} (#{squires.first.hp} points de vie) - tapez '1'
      - attaquer #{squires.last} (#{squires.last.hp} points de vie) - tapez '2'
      - vous soigner (#{player.hp} points de vie)- tapez 'h'
      - voir vos statistiques - tapez 's'
      - voir les statistiques de #{squires.first} - tapez 's1'
      - voir les statistiques de #{squires.last} - tapez 's2'
      - quitter l'entrainement - tapez 'q'
      ASK_FOR_TRAINING_ACTION
    end

    def player_is_stunt
      <<~PLAYER_IS_STUNT
      Si deux faibles écuyers peuvent vous battre, vous n'êtes vraiment pas à \
 la hauteur... RETOURNEZ VOUS ENTRAINER !!!
      PLAYER_IS_STUNT
    end

    def squires_are_all_stunt
      <<~SQUIRES_STUNT
      Bravo !! Les deux écuyers sont évanouis, vous avez bien combattu !

      Vous regardez les écuyers d'un air satisfait, et vous rangez vore arme.

      Vos ennemis n'ont qu'à bien se tenir...
      SQUIRES_STUNT
    end

    def quit_solo_training
      <<~QUIT_SOLO_TRAINING
      Ce combat est décidément bien ennuyeux. Vous rangez votre arme et \
retournez vous asseoir sur le banc. Vous vous demandez ce que vous allez faire \
maintenant.
      QUIT_SOLO_TRAINING
    end

    def unexpected_training_ending
      <<~UNEXPECTED_TRAING_ENDING
      L'entrainement s'est terminé, mais il semble que ni vous ni les écuyers \
ne soyez assommés. Il doit y avoir une erreur dans le programme, \
adressez-vous à son créateur.
      UNEXPECTED_TRAING_ENDING
    end

    def too_bad_a_squire_passe_out(squire)
      <<~SQUIRE_PASSED_OUT
      Oh non !!!! Vous avez tué un écuyer !!!!

      Ce n'est pas sérieux çà, #{squire} était un écuyer tout neuf...\
 Et puis il va falloir tout nettoyer maintenant, flûte !

      Un peu penaud, vous rangez votre arme. L'écuyer restant, terrorisé,\
 vous regarde vous en aller...
      SQUIRE_PASSED_OUT
    end
  end
end
