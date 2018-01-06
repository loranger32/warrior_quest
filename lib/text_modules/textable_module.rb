# Here are all the texts of the game - will probably be removed to a yaml file
module Textable
  # Introduction texts
  module Introduction
    def self.welcome
      <<-WEL.strip_heredoc
  Bienvenue dans le jeu 'la quête du guérrier'.
  Un jeu d'aventure et d'exploration.
      WEL
    end

    def self.ask_name
      "Quel est votre nom ? ('enter' pour choisir le nom, 'h' pour les\
 consignes):"
    end

    def self.name_rules
      <<-NAME_RULES.strip_heredoc
  Le nom que vous choisirez doit respecter les règles suivantes:
  - le nom ne peut être vide ou composé uniquement d'espaces ou tabulations ;
  - pas de chiffres (les chiffres romains sont autorisés) ;
  - pas plus d'un espace à la suite (donc pas de tabulation) ;
  - pas de retour à la ligne ;
  - le nom peut contenir indifférement des letters minuscules ou majuscules ;
  - pas d'espace vide à la fin du nom ;

  Ok, choisissez votre nom maintenant:
      NAME_RULES
    end

    def self.greet_and_explain(name)
      <<-EXPL.strip_heredoc
  Vous êtes un valeureux guérrier nommé #{name}!!

  Vous êtes au royaume du bon Roi Arthur. Jusqu'il y a peu, le royaume était
  paisible et heureux.

  Les récoltes étaient bonnes, les gens étaient heureux et le trésor était
  bien garni.

  Le bon roi Arthur a une fille, la princesse Alice. Elle est jolie, douce
  et tout le monde l'aime beaucoup.

  Alice a un amoureux, vous, le chevalier.Et vous allez vous marrier.

  Malheureusement, le dragon Snork a brulé le royaume, volé le trésor, et
  enlevé la princesse Alice.

  Il s'est réfugié dans la Montagne Sombre et y garde le trésor et la princesse.
  Comme tous les bons dragons, il se repose maintenant sur le trésor...

  Le Roi Arthur compte sur vous pour sauver le trésor, la princesse, et par la
  même occasion le Royaume.

  En partant du chateau, vous devrez traverser la Plaine Incendiée, vous
  frayer une chemin parmi les Marais Puant et franchir le Gouffre Infernal
  pour enfin accéder à la Montagne Sombre.

  Là, vous devrez affronter le dragon...
      EXPL
    end

    def self.ask_player_what_to_do
      <<-ASK.strip_heredoc
  Que souhaitez-vous faire:
    - commencer une nouvelle partie ? ('n')
    - réaliser un combat d'entraînement ? ('e')
    - reprendre une partie sauvegardée ? ('l')
      ASK
    end
  end
end
