require_relative '../Character_class.rb'

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
  end

  context 'when initialized with arguments' do

    before do
      $stdout = StringIO.new
      @character = Character.new(name: "laurent", hp: 120, strength: 12, 
                                 spirit: 12, agility: 12)
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

  context 'when attacking' do
    before do
      @attacker = Character.new(name: 'attacker')
      @defender = Character.new(name: 'defender')
    end

    it 'reduce hp points of the defender' do
      expect(@defender.hp).to eq(100)
      expect(@attacker.strength).to eq(8)
      @attacker.attack(@defender)
      expect(@defender.hp).to eq(92)
    end


  end
end
