require_relative '../lib/character_classes/warrior_class'

RSpec.describe "A warrior" do

  context "when initialized with arguments" do

    before do
      @warrior = Warrior.new(name: "Laurent", 
                             strength: 14,
                             spirit: 10,
                             agility: 12,
                             weapon: :sword,
                             mana: 10)
    end

    it "has a name" do
      expect(@warrior.name).to eq("Laurent")
    end

    it "has strength points" do
      expect(@warrior.strength).to eq(14)
    end

    it "has spirit points" do
      expect(@warrior.spirit).to eq(10)
    end

    it "has agility points" do
      expect(@warrior.agility).to eq(12)
    end

    it "has a weapon" do
      expect(@warrior.weapon).to be_instance_of(Sword)
    end

    it "has mana points" do
      expect(@warrior.mana).to eq(10)
    end
  end

  context "when initialized with no arguments" do
    before do
      @warrior = Warrior.new
    end

    it "has a name" do
      expect(@warrior.name).to match(/\Apnj_\d+\z/)
    end

    it 'has default strength points' do
      expect(@warrior.strength).to eq(8)
    end 

    it "has default hp points" do
      expect(@warrior.hp).to eq(100)
    end

    it "has default spirit points" do
      expect(@warrior.spirit).to eq(8)
    end

    it "has default agility points" do
      expect(@warrior.agility).to eq(8)
    end

    it "has mana points" do
      expect(@warrior.mana).to eq(25)
    end

    it "has no weapon" do
      expect(@warrior.weapon).to be_kind_of(BareHands)
    end

    it "has a max_hp attribute equal to hp attribute" do
      expect(@warrior.max_hp).to eq(@warrior.hp)
    end
  end

  context "it can do some actions" do
    before do
      @warrior = Warrior.new(name: "Laurent", 
                             strength: 14,
                             spirit: 10,
                             agility: 12,
                             weapon: :sword,
                             mana: 10)
      @space = Space.new(description: "Here goes the description of the space.")
    end

    it 'can have a look around' do
      expect(@warrior.look_around(@space)).to be_kind_of(String)
    end
  end
end
