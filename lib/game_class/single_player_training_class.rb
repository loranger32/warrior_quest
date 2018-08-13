class SinglePlayerTraining < TrainingSession

  SOLO_TRAINING_TITLE = 'Entrainement Solo'.freeze
  SINGLE_TRAINING_ACTIONS = %w[1 2 h s s1 s2 q].freeze
  SINGLE_TRAINING_VIEWING_ACTIONS = %w[s s1 s2].freeze
  SINGLE_TRAINING_WEAPONS = {barehands: 'm', sword: 'e', axe: 'h',
                             shortsword: 'd', spear: 'l', staff: 'b'}.freeze

  attr_reader :squires

  def post_initialize(squires: set_two_squires)
    @squires = squires
  end

  def play
    launch_single_player_training_intro
    player_chooses_weapon
    wait_until_ready_to_go_on
    
    while player_is_not_stunt? && !all_squires_are_stunt?
      single_player_turn
      if one_squire_died?
        print_message(squire_passed_out(dead_squire))
        break
      end

      break if has_stopped_playing?

      wait_until_ready_to_go_on
      single_player_training_squires_turn
    end
    unless one_squire_died?
      if has_stopped_playing?
        print_message(Textable::TrainingText.quit_solo_training)
      elsif player_is_stunt?
        print_message(Textable::TrainingText.player_is_stunt)
      elsif all_squires_are_stunt?
        print_message(Textable::TrainingText.squires_are_all_stunt)
      else
        print_message(Textable::TrainingText.unexpected_training_ending)
      end
    end
  end

  def launch_single_player_training_intro
    set_two_squires
    clear_screen_with_title(SOLO_TRAINING_TITLE)
    print_message(Textable::TrainingText.present_solo_training)
    show_squires
    wait_until_ready_to_go_on
    clear_screen_with_title(SOLO_TRAINING_TITLE)
    print_message(Textable::TrainingText.begin_solo_training)
  end

  def player_chooses_weapon
    print_message(Textable::TrainingText.ask_which_weapon_to_use)
    weapon_choice = Validable.obtain_a_valid_input_from_list(SINGLE_TRAINING_WEAPONS.values)
    weapon = equip_player_with_weapon(player, weapon_choice)
    print_message("Ok, vous combatterez avec : #{weapon.name}")
  end

  def equip_player_with_weapon(player, weapon_choice)
    weapon = case weapon_choice
             when SINGLE_TRAINING_WEAPONS[:barehands]  then BareHands.new
             when SINGLE_TRAINING_WEAPONS[:sword]      then Sword.new
             when SINGLE_TRAINING_WEAPONS[:axe]        then Axe.new
             when SINGLE_TRAINING_WEAPONS[:shortsword] then ShortSword.new
             when SINGLE_TRAINING_WEAPONS[:spear]      then Spear.new
             when SINGLE_TRAINING_WEAPONS[:staff]      then Staff.new
             end

    player.equip_weapon(weapon)
    weapon
  end

  def single_player_turn
    while true
      clear_screen_with_title(SOLO_TRAINING_TITLE)
      prompt(Textable::TrainingText.ask_for_training_action_with(player,
                                                                 squires))

      choice = Validable.obtain_a_valid_input_from_list(SINGLE_TRAINING_ACTIONS)
      process_player_choice(choice)
  
      next wait_until_ready_to_go_on if \
        SINGLE_TRAINING_VIEWING_ACTIONS.include?(choice.downcase)

      unless one_squire_died? || player_is_stunt? || all_squires_are_stunt? ||
        has_stopped_playing?
        print_message("Fin de votre action, aux écuyers de jouer !")
      end

      break
    end
  end

  def single_player_training_squires_turn
    squires.each do |squire|
      if squire.stunt?
        print_message("#{squire} est évanoui, il ne peut pas attaquer.")
      else
        Fightable.describe_combat_between(squire, player)
      end
      wait_until_ready_to_go_on
    end
    unless all_squires_are_stunt?
      print_message("Fin du tour des écuyers, à vous !")
      wait_until_ready_to_go_on
    end
  end

  def process_player_choice(choice)
    case choice.downcase
      when '1'  then Fightable.describe_combat_between(player, squires.first)
      when '2'  then Fightable.describe_combat_between(player, squires.last)
      when 'h'  then Healable.describe_self_healing(player)
      when 's'  then display_player_stats
      when 's1' then show_individual_squire_stats(1)
      when 's2' then show_individual_squire_stats(2)
      when 'q'  then quit_playing
    end
  end
end
