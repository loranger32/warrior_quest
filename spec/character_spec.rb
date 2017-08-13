require_relative '../character_class'
require_relative '../weapons_class'
require_relative '../die_class'

describe 'A Character' do

  context 'when initialized with no arguments but the name' do

    before do
      $stdout = StringIO.new
      @character = Character.new(name: 'laurent')
    end

      it "has a name" do
        expect(@character.name).to eq("laurent")
      end

      it 'has default strength points' do
        expect(@character.strength).to eq(8)
      end 

      it "has default hp points" do
        expect(@character.hp).to eq(100)
      end

      it "has default spirit points" do
        expect(@character.spirit).to eq(8)
      end

      it "has default agility points" do
        expect(@character.agility).to eq(8)
      end

      it "has no weapon" do
        expect(@character.weapon).to be_kind_of(BareHands)
      end
  end

  context 'when initialized with arguments' do

    before do
      $stdout = StringIO.new
      @character = Character.new(name: "laurent", hp: 120, strength: 12, 
                                 spirit: 12, agility: 12, weapon: :sword)
    end

      it "has a name" do
        expect(@character.name).to eq("laurent")
      end

      it "has hp points" do
        expect(@character.hp).to eq(120)
      end

      it 'has strength points' do
        expect(@character.strength).to eq(12)
      end

      it "has spirit points" do
        expect(@character.spirit).to eq(12)
      end

      it "has agility points" do
        expect(@character.agility).to eq(12)
      end

      it 'has a weapon' do
        expect(@character.weapon).to be_instance_of(Sword)
      end

      it "print its name capitalized when printed" do
        expect { puts @character }.to output("Laurent\n").to_stdout
      end
  end

  context 'when initialized with no arguments' do

    before do
      $stdout = StringIO.new
      @character1 = Character.new
      @character2 = Character.new
      @character3 = Character.new
      @character4 = Character.new
    end

    it 'has a serialized name and print it capitalzed' do
      expect(@character1.name).to eq('pnj_1')
      expect(@character2.name).to eq('pnj_2')
      expect(@character3.name).to eq('pnj_3')
      expect(@character4.name).to eq('pnj_4')
      expect { puts @character1 }.to output("Pnj_1\n").to_stdout
      expect { puts @character2 }.to output("Pnj_2\n").to_stdout
      expect { puts @character3 }.to output("Pnj_3\n").to_stdout
      expect { puts @character4 }.to output("Pnj_4\n").to_stdout
    end
  end

  context 'when rolling dies' do
    
    before do
      @character = Character.new
      @die_4 = Die.new(4)
      @die_6 = Die.new
      @die_8 = Die.new(8)
      @die_10 = Die.new(10)
      @die_12 = Die.new(12)
      @die_20 = Die.new(20)
      @die_100 = Die.new(100)
    end

    it 'can roll multiple times a die of 4' do
      expect(@character.throw_die_of_4_times(3)).to be_between(3, 12).inclusive
    end

    it 'can roll multiple times a die of 6' do
      expect(@character.throw_die_of_6_times(3)).to be_between(3, 18).inclusive
    end

    it 'can roll multiple times a die of 8' do
      expect(@character.throw_die_of_8_times(3)).to be_between(3, 24).inclusive
    end

    it 'can roll multiple times a die of 12' do
      expect(@character.throw_die_of_12_times(3)).to be_between(3, 36).inclusive
    end

    it 'can roll multiple times a die of 20' do
      expect(@character.throw_die_of_20_times(3)).to be_between(3, 60).inclusive
    end

    it 'can roll multiple times a die of 100' do
      expect(@character.throw_die_of_100_times(3)).to be_between(3, 300).inclusive
    end

    it 'throws an error when trying to roll dies of 4 zero times' do
      expect { @character.throw_die_of_4_times(0) }.to raise_error(CannotHaveZeroRollsError)
    end

    it 'throws an error when trying to roll dies of 6 zero times' do
      expect { @character.throw_die_of_6_times(0) }.to raise_error(CannotHaveZeroRollsError)
    end
    
    it 'throws an error when trying to roll dies of 8 zero times' do
      expect { @character.throw_die_of_8_times(0) }.to raise_error(CannotHaveZeroRollsError)
    end
    
    it 'throws an error when trying to roll dies of 10 zero times' do
      expect { @character.throw_die_of_10_times(0) }.to raise_error(CannotHaveZeroRollsError)
    end
    
    it 'throws an error when trying to roll dies of 12 zero times' do
      expect { @character.throw_die_of_12_times(0) }.to raise_error(CannotHaveZeroRollsError)
    end
    
    it 'throws an error when trying to roll dies of 20 zero times' do
      expect { @character.throw_die_of_20_times(0) }.to raise_error(CannotHaveZeroRollsError)
    end
    
    it 'throws an error when trying to roll dies of 100 zero times' do
      expect { @character.throw_die_of_100_times(0) }.to raise_error(CannotHaveZeroRollsError)
    end
  end

  context 'when attacking with bare hands' do
    before do
      @attacker = Character.new(name: 'attacker')
      @defender = Character.new(name: 'defender')
    end

    it 'reduce hp points of the defender' do
      expect(@defender.hp).to eq(100)
      @attacker.attack(@defender)
      expect(@defender.hp).to be_between(76, 90)
    end
  end

  context 'can inflict distinct damage points' do

    before do
    @attacker = Character.new(name: 'attacker', weapon: :sword)
    @defender = Character.new(name: 'defender')
    end

    it 'with a sword' do
      expect(@attacker.damage_points)
      .to be_between((8 + 2 + 15), (8 + 16 + 15))
    end 

  end

  context 'when attacking with a sword' do
    before do
      @attacker = Character.new(name: 'attacker', weapon: :sword)
      @defender = Character.new(name: 'defender')
    end

      it 'inflict sword damages' do
        @attacker.attack(@defender)
        expect(@defender.hp)
        .to be_between(
          (8 + @attacker.throw_die_of_8_times(2) + 15 ),
          (@defender.hp + 2))
      end

  end
end
