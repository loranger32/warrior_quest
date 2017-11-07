require_relative '../lib/character_classes/character_class'
require_relative '../lib/character_classes/warrior_class'
require_relative '../lib/character_classes/dwarf_class'
require_relative '../lib/character_classes/elve_class'
require_relative '../lib/character_classes/wizard_class'
require_relative '../lib/item_classes/weapons_class'
require_relative '../lib/item_classes/die_class'

RSpec.shared_examples "A Character object" do |character_class|
  context "can respond to accessor methods like" do
    before do
      @character = character_class.new(name: 'joe', hp: 100, strength: 8,
                                       spirit: 10, agility: 12, mana: 20,
                                       weapon: :staff)
    end
      
      it ":type" do
        expect(@character).to respond_to(:type)
      end

      it ":name" do
        expect(@character).to respond_to(:name)
      end

      it ":hp" do
        expect(@character).to respond_to(:hp)
      end

      it ":strentgh" do
        expect(@character).to respond_to(:strength)
      end

      it ":spirit" do
        expect(@character).to respond_to(:spirit)
      end

      it ":agility" do
        expect(@character).to respond_to(:agility)
      end

      it ":mana" do
        expect(@character).to respond_to(:mana)
      end

      it ":max_hp" do
        expect(@character).to respond_to(:max_hp)
      end

      it ":last_inflicted_damage" do
        expect(@character).to respond_to(:last_inflicted_damage)
      end

      it ":weapon" do
        expect(@character).to respond_to(:weapon)
      end
  end

  context "can respond to other public methods like" do
    before do
      @character = character_class.new(name: 'joe', hp: 100, strength: 8,
                                       spirit: 10, agility: 12, mana: 20,
                                       weapon: :staff)
    end

      it ":reduce_hp_by" do
        expect(@character).to respond_to(:reduce_hp_by)
      end

      it ":restore_hp_by" do
        expect(@character).to respond_to(:restore_hp_by)
      end

      it ":defense_points" do
        expect(@character).to respond_to(:defense_points)
      end

      it ":fire_ball_defense_points" do
        expect(@character).to respond_to(:fire_ball_defense_points)
      end

      it ":set_weapon" do
        expect(@character).to respond_to(:set_weapon)
      end
  end


  context 'when initialized with arguments' do
    before do
      @character = character_class.new(name: 'joe', hp: 100, strength: 8,
                                       spirit: 10, agility: 12, mana: 20,
                                       weapon: :staff)
    end

      it "has a name" do
        expect(@character.name).to eq("joe")
      end

      it 'has strength points' do
        expect(@character.strength).to eq(8)
      end 

      it "has hp points" do
        expect(@character.hp).to eq(100)
      end

      it "has spirit points" do
        expect(@character.spirit).to eq(10)
      end

      it "has agility points" do
        expect(@character.agility).to eq(12)
      end

      it "has mana points" do
        expect(@character.mana).to eq(20)
      end

      it "has a staff as weapon" do
        expect(@character.weapon).to be_kind_of(Staff)
      end

      it "has a max_hp attribute equal to hp attribute" do
        expect(@character.max_hp).to eq(@character.hp)
      end

      it "has a last inflicted damage attribute of 0" do
        expect(@character.last_inflicted_damage).to eq(0)
      end
  end

  context "when initialized with no argruments" do
    before do
      @character = character_class.new
      @character_class = character_class
    end

      it "has default hp points" do
        expect(@character.hp).to eq(@character_class::DEFAULTS[:hp])
      end

      it 'has default strength points' do
        expect(@character.strength).to eq(@character_class::DEFAULTS[:strength])
      end 

      it "has default spirit points" do
        expect(@character.spirit).to eq(@character_class::DEFAULTS[:spirit])
      end

      it "has default agility points" do
        expect(@character.agility).to eq(@character_class::DEFAULTS[:agility])
      end

      it "has default weapon" do
        expect(@character.weapon)
          .to be_kind_of(
            @character.set_weapon(@character_class::DEFAULTS[:weapon]).class)
      end

      it "has a max_hp attribute equal to hp attribute" do
        expect(@character.max_hp).to eq(@character.hp)
      end

      it "has a last inflicted damage of 0" do
        expect(@character.last_inflicted_damage).to eq(0)
      end
  end
end

describe 'Warrior' do
  include_examples "A Character object", Warrior
end

describe 'Wizard' do
  include_examples "A Character object", Wizard
end

describe 'Dwarf' do
  include_examples "A Character object", Dwarf
end

describe 'Elve' do
  include_examples "A Character object", Elve
end



#   context 'when initialized with arguments' do

#     before do
#       $stdout = StringIO.new
#       @character = Character.new(name: "laurent", hp: 120, strength: 12, 
#                                  spirit: 12, agility: 12, weapon: :sword)
#     end

#       it "has a name" do
#         expect(@character.name).to eq("laurent")
#       end

#       it "has hp points" do
#         expect(@character.hp).to eq(120)
#       end

#       it 'has strength points' do
#         expect(@character.strength).to eq(12)
#       end

#       it "has spirit points" do
#         expect(@character.spirit).to eq(12)
#       end

#       it "has agility points" do
#         expect(@character.agility).to eq(12)
#       end

#       it 'has a weapon' do
#         expect(@character.weapon).to be_instance_of(Sword)
#       end

#       it "print its name capitalized when printed" do
#         expect { puts @character }.to output("Laurent\n").to_stdout
#       end

#       it "has a max_hp attribute equal to hp attribute" do
#         expect(@character.max_hp).to eq(@character.hp)
#       end
#   end

#   context 'when initialized with no arguments' do

#     before do
#       $stdout = StringIO.new
#       @character1 = Character.new
#       @character2 = Character.new
#       @character3 = Character.new
#       @character4 = Character.new
#     end

#     it 'has a serialized name and print it capitalzed' do
#       expect(@character1.name).to eq('pnj_1')
#       expect(@character2.name).to eq('pnj_2')
#       expect(@character3.name).to eq('pnj_3')
#       expect(@character4.name).to eq('pnj_4')
#       expect { puts @character1 }.to output("Pnj_1\n").to_stdout
#       expect { puts @character2 }.to output("Pnj_2\n").to_stdout
#       expect { puts @character3 }.to output("Pnj_3\n").to_stdout
#       expect { puts @character4 }.to output("Pnj_4\n").to_stdout
#     end
#   end

#   context 'when rolling dies' do
    
#     before do
#       @character = Character.new
#       @die_4 = Die.new(4)
#       @die_6 = Die.new
#       @die_8 = Die.new(8)
#       @die_10 = Die.new(10)
#       @die_12 = Die.new(12)
#       @die_20 = Die.new(20)
#       @die_100 = Die.new(100)
#     end

#     it 'can roll multiple times a die of 4' do
#       expect(@character.throw_die_of_4_times(3)).to be_between(3, 12).inclusive
#     end

#     it 'can roll multiple times a die of 6' do
#       expect(@character.throw_die_of_6_times(3)).to be_between(3, 18).inclusive
#     end

#     it 'can roll multiple times a die of 8' do
#       expect(@character.throw_die_of_8_times(3)).to be_between(3, 24).inclusive
#     end

#     it 'can roll multiple times a die of 12' do
#       expect(@character.throw_die_of_12_times(3)).to be_between(3, 36).inclusive
#     end

#     it 'can roll multiple times a die of 20' do
#       expect(@character.throw_die_of_20_times(3)).to be_between(3, 60).inclusive
#     end

#     it 'can roll multiple times a die of 100' do
#       expect(@character.throw_die_of_100_times(3))
#         .to be_between(3, 300).inclusive
#     end

#     it 'throws an error when trying to roll dies of 4 zero times' do
#       expect { @character.throw_die_of_4_times(0) }
#         .to raise_error(CannotHaveZeroRollsError)
#     end

#     it 'throws an error when trying to roll dies of 6 zero times' do
#       expect { @character.throw_die_of_6_times(0) }
#         .to raise_error(CannotHaveZeroRollsError)
#     end
    
#     it 'throws an error when trying to roll dies of 8 zero times' do
#       expect { @character.throw_die_of_8_times(0) }
#         .to raise_error(CannotHaveZeroRollsError)
#     end
    
#     it 'throws an error when trying to roll dies of 10 zero times' do
#       expect { @character.throw_die_of_10_times(0) }
#         .to raise_error(CannotHaveZeroRollsError)
#     end
    
#     it 'throws an error when trying to roll dies of 12 zero times' do
#       expect { @character.throw_die_of_12_times(0) }
#         .to raise_error(CannotHaveZeroRollsError)
#     end
    
#     it 'throws an error when trying to roll dies of 20 zero times' do
#       expect { @character.throw_die_of_20_times(0) }
#         .to raise_error(CannotHaveZeroRollsError)
#     end
    
#     it 'throws an error when trying to roll dies of 100 zero times' do
#       expect { @character.throw_die_of_100_times(0) }
#         .to raise_error(CannotHaveZeroRollsError)
#     end
#   end

#   context 'when attacking with bare hands' do
    
#     before do
#       @attacker = Character.new(name: 'attacker')
#       @defender = Character.new(name: 'defender')
#     end

#     it 'reduces hp points of the defender accordingly' do
#       expect(@defender.hp).to eq(100)
#       @attacker.attack(@defender)
#       expect(@defender.hp).to be_between(76, 90)
#     end
#   end

#   context 'when attacking with a sword' do

#     before do
#       @attacker = Character.new(name: 'attacker', weapon: :sword)
#       @defender = Character.new(name: 'defender')
#       basic_damage_with_sword = 
#         @attacker.strength + @attacker.weapon.attack_bonus
#       # two dies of 8 with 16 as result
#       @max_damage_with_sword = basic_damage_with_sword + 16
#       # two dies of 8 with 2 as result 
#       @min_damage_with_sword = basic_damage_with_sword + 2  
#     end

#     it 'has a sword' do 
#       expect(@attacker.weapon).to be_instance_of(Sword)
#     end

#     it 'has damage points of a sword' do
#       expect(@attacker.damage_points)
#       .to be_between(@min_damage_with_sword, @max_damage_with_sword)
#     end

#     it 'reduces hp points of the defender accordingly' do
#       starting_hp_points = @defender.hp
#       @attacker.attack(@defender)
#       expect(@defender.hp)
#       .to be_between(starting_hp_points - @max_damage_with_sword,
#         starting_hp_points - @min_damage_with_sword)
#     end 
#   end

#   context 'when attacking with a staff' do

#     before do
#       @attacker = Character.new(name: 'attacker', weapon: :staff)
#       @defender = Character.new(name: 'defender')
#       basic_damage_with_staff = 
#         @attacker.strength + @attacker.weapon.attack_bonus
#       # two dies of 8 with 16 as result
#       @max_damage_with_staff = basic_damage_with_staff + 16
#       # two dies of 8 with 2 as result 
#       @min_damage_with_staff = basic_damage_with_staff + 2  
#     end

#     it 'has a staff' do 
#       expect(@attacker.weapon).to be_instance_of(Staff)
#     end

#     it 'has damage points of a staff' do
#       expect(@attacker.damage_points)
#       .to be_between(@min_damage_with_staff, @max_damage_with_staff)
#     end

#     it 'reduces hp points of the defender accordingly' do
#       starting_hp_points = @defender.hp
#       @attacker.attack(@defender)
#       expect(@defender.hp)
#       .to be_between(starting_hp_points - @max_damage_with_staff,
#         starting_hp_points - @min_damage_with_staff)
#     end 
#   end

#   context 'when attacking with a spear' do

#     before do
#       @attacker = Character.new(name: 'attacker', weapon: :spear)
#       @defender = Character.new(name: 'defender')
#       basic_damage_with_spear = 
#         @attacker.strength + @attacker.weapon.attack_bonus
#       # two dies of 8 with 16 as result
#       @max_damage_with_spear = basic_damage_with_spear + 16
#       # two dies of 8 with 2 as result 
#       @min_damage_with_spear = basic_damage_with_spear + 2  
#     end

#     it 'has a spear' do 
#       expect(@attacker.weapon).to be_instance_of(Spear)
#     end

#     it 'has damage points of a spear' do
#       expect(@attacker.damage_points)
#       .to be_between(@min_damage_with_spear, @max_damage_with_spear)
#     end

#     it 'reduces hp points of the defender accordingly' do
#       starting_hp_points = @defender.hp
#       @attacker.attack(@defender)
#       expect(@defender.hp)
#       .to be_between(starting_hp_points - @max_damage_with_spear,
#         starting_hp_points - @min_damage_with_spear)
#     end 
#   end

#   context 'when attacking with a two hands axe' do

#     before do
#       @attacker = Character.new(name: 'attacker', weapon: :axe)
#       @defender = Character.new(name: 'defender')
#       basic_damage_with_axe = 
#         @attacker.strength + @attacker.weapon.attack_bonus
#       # two dies of 8 with 16 as result
#       @max_damage_with_axe = basic_damage_with_axe + 16
#       # two dies of 8 with 2 as result 
#       @min_damage_with_axe = basic_damage_with_axe + 2  
#     end

#     it 'has an axe' do 
#       expect(@attacker.weapon).to be_instance_of(Axe)
#     end

#     it 'has damage points of a axe' do
#       expect(@attacker.damage_points)
#       .to be_between(@min_damage_with_axe, @max_damage_with_axe)
#     end

#     it 'reduces hp points of the defender accordingly' do
#       starting_hp_points = @defender.hp
#       @attacker.attack(@defender)
#       expect(@defender.hp)
#       .to be_between(starting_hp_points - @max_damage_with_axe,
#         starting_hp_points - @min_damage_with_axe)
#     end 
#   end

#   context 'when attacking with a short sword' do

#     before do
#       @attacker = Character.new(name: 'attacker', weapon: :short_sword)
#       @defender = Character.new(name: 'defender')
#       basic_damage_with_short_sword = 
#         @attacker.strength + @attacker.weapon.attack_bonus
#       # two dies of 8 with 16 as result
#       @max_damage_with_short_sword = basic_damage_with_short_sword + 16
#       # two dies of 8 with 2 as result 
#       @min_damage_with_short_sword = basic_damage_with_short_sword + 2  
#     end

#     it 'has a short_sword' do 
#       expect(@attacker.weapon).to be_instance_of(ShortSword)
#     end

#     it 'has damage points of a short_sword' do
#       expect(@attacker.damage_points)
#       .to be_between(@min_damage_with_short_sword, @max_damage_with_short_sword)
#     end

#     it 'reduces hp points of the defender accordingly' do
#       starting_hp_points = @defender.hp
#       @attacker.attack(@defender)
#       expect(@defender.hp)
#       .to be_between(starting_hp_points - @max_damage_with_short_sword,
#         starting_hp_points - @min_damage_with_short_sword)
#     end 
#   end
# end
