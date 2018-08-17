class SinglePlayerTraining < TrainingSession
 
  TITLE = 'Entrainement Solo'
  ACTIONS = %w[1 2 h s s1 s2 q].freeze
  VIEWING_ACTIONS = %w[s s1 s2].freeze
  WEAPONS = {barehands: 'm', sword: 'e', axe: 'h', shortsword: 'd', spear: 'l',
             staff: 'b'}.freeze

  attr_reader :squires

  def post_initialize(squires: set_two_squires)
    @squires = squires
  end

  def weapons
    WEAPONS
  end

  def play
    launch_single_player_training_intro
    player_chooses_weapon
    wait_until_ready_to_go_on
    
    while player_is_not_stunt? && !all_squires_are_stunt?
      SoloPlayerTurn.new(player, squires, self).play

      break if has_stopped_playing?
      break print_message(squire_passed_out(dead_squire)) if one_squire_died?

      wait_until_ready_to_go_on

      SoloOpponentsTurn.new(player, squires, self).play
    end
    
    print_end_training_message unless one_squire_died?
  end

  def launch_single_player_training_intro
    set_two_squires
    clear_screen_with_title(title)
    print_message(Textable::TrainingText.present_solo_training)
    show_squires
    wait_until_ready_to_go_on
    clear_screen_with_title(title)
    print_message(Textable::TrainingText.begin_solo_training)
  end

  def player_chooses_weapon
    print_message(Textable::TrainingText.ask_which_weapon_to_use)
    weapon_choice = Validable.obtain_a_valid_input_from_list(weapons.values)
    weapon = equip_player_with_weapon(player, weapon_choice)
    print_message("Ok, vous combatterez avec : #{weapon.name}")
  end

  def equip_player_with_weapon(player, weapon_choice)
    weapon = case weapon_choice
             when weapons[:barehands]  then BareHands.new
             when weapons[:sword]      then Sword.new
             when weapons[:axe]        then Axe.new
             when weapons[:shortsword] then ShortSword.new
             when weapons[:spear]      then Spear.new
             when weapons[:staff]      then Staff.new
             end

    player.equip_weapon(weapon)
    weapon
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

  def end_condition?
    one_squire_died? || player_is_stunt? || all_squires_are_stunt? ||
        has_stopped_playing?
  end

  def print_end_training_message
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
