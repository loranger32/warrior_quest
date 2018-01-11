# Here are all the texts of the game - will probably be removed to a yaml file
module Textable
  # Introduction texts
  module Introduction
    module_function

    def welcome
      <<~WEL
  Bienvenue dans le jeu 'la quête du Chevalier', un jeu d'aventure et\
 d'exploration.
      WEL
    end

    def ask_name
      <<~ASK_NAME
      Vous devez d'abord choisir un nom pour votre Chevalier. Quelques règles\
 simples sont à respecter pour le choix du nom. 
      ASK_NAME
    end

    def name_rules
      <<~NAME_RULES
  Le nom que vous choisirez doit respecter les règles suivantes:
  - le nom ne peut être vide ou composé uniquement d'espaces ou tabulations ;
  - pas de chiffres (les chiffres romains sont autorisés) ;
  - pas plus d'un espace à la suite (donc pas de tabulation) ;
  - pas de retour à la ligne ;
  - le nom peut contenir indifférement des letters minuscules ou majuscules ;
  - pas d'espace vide à la fin du nom ;

      NAME_RULES
    end

    def greet_and_explain(name)
      <<~EXPL
  Vous êtes un valeureux guérrier nommé ***#{name.upcase}***, et vous êtes au\
 service du bon Roi Arthur.

  Jusqu'il y a peu, le royaume était paisible et heureux, avec un trésor bien\
 garni. 

  Vous êtes fiancé à la douce et belle princesse Alice, la fille du Roi.

  Malheureusement, il y a quelques jours, le méchant dragon Snork a brulé le\
 royaume, volé le trésor, et enlevé la princesse Alice.

  Il s'est réfugié dans la Montagne Sombre, avec la princesse et le trésor.
  
  Comme tous les bons dragons, il se repose maintenant sur le trésor. Quant à\
 la princesse, qui sait ce qui peut lui arriver maintenant...

  N'écoutant que votre courage, vous avez proposé au Roi d'aller délivrer la\
 princesse et récupérer le trésor.

  Il vous a adjoint une équipe de ses meilleurs soldats pour vous aider:
  - *HOKUSPOKUS* le magicien (peut lancer des sorts puissants et est un peu\
 distrait)
  - *PASSIPTI*   le nain (très résistant, intelligent du biceps et susceptible)
  - *TOUDOU*     l'elfe (fragile, coquet, mais peut soigner les joueurs)

  En partant du chateau, vous devrez traverser la Plaine Incendiée, vous\
 frayer une chemin parmi les Marais Puant et franchir le Gouffre Infernal\
 pour enfin accéder à la Montagne Sombre et affronter le dragon.
      EXPL
    end

    def ask_player_what_to_do
      <<~ASK
  Que souhaitez-vous faire:
    - commencer une nouvelle partie ? ('n')
    - réaliser un combat d'entraînement ? ('e')
    - reprendre une partie sauvegardée ? ('l')
      ASK
    end
  end
end
