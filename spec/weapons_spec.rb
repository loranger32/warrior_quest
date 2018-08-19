require_relative '../lib/character_classes/character_class'
require_relative '../lib/item_classes/weapons_class'

RSpec.describe "A object of the Weapon Class" do
  context 'when attributes are given' do
    before do 
      @weapon = Weapon.new(name: "une arme",
                           display_name: 'son arme',
                           attack_bonus: 10,
                           defense_bonus: 10,
                           durability: 20)
    end

    it 'respond to :set_default_name' do
      expect(@weapon).to respond_to(:set_default_name)
    end

    it 'respond to :set_default_display_name' do
      expect(@weapon).to respond_to(:set_default_display_name)
    end

    it 'respond to :set_default_attack_bonus' do
      expect(@weapon).to respond_to(:set_default_attack_bonus)
    end

    it 'respond to :set_default_defense_bonus' do
      expect(@weapon).to respond_to(:set_default_defense_bonus)
    end

    it 'respond to :set_default_durability' do
      expect(@weapon).to respond_to(:set_default_durability)
    end

    it 'respond to :name' do
      expect(@weapon).to respond_to(:name)
    end

    it 'respond to :attack_bonus' do
      expect(@weapon).to respond_to(:attack_bonus)
    end

    it 'respond to :defense_bonus' do
      expect(@weapon).to respond_to(:defense_bonus)
    end

    it 'respond to :durability' do
      expect(@weapon).to respond_to(:durability)
    end

    it 'respond to :impair_by' do
      expect(@weapon).to respond_to(:impair_by)
    end
    it 'respond to :repair_by' do
      expect(@weapon).to respond_to(:repair_by)
    end
  end
end

RSpec.shared_examples "weapons" do |weapon_class|

  context 'when attributes are given' do
    before do
      @weapon = weapon_class.new(name: 'arme', attack_bonus: 15,
        defense_bonus: 5, durability: 50)
    end

    it 'has a name' do
      expect(@weapon.name).to eq('arme')
    end

    it 'has an attack bonus' do
      expect(@weapon.attack_bonus).to eq(15)
    end

    it 'has a defense bonus' do
      expect(@weapon.defense_bonus).to eq(5)
    end

    it 'has durability points' do
      expect(@weapon.durability).to eq(50)
    end

    it 'has a max durability points attribute' do
      expect(@weapon.max_durability).to eq(@weapon.durability)
    end

    it 'cannot change its max durability attribute' do
      expect { @weapon.max_durability = 20 }.to raise_error(NoMethodError)
    end
  end

  context 'in action' do
    before do
    @weapon = weapon_class.new(name: 'arme', attack_bonus: 15, defense_bonus: 5,
      durability: 50)
    end


    it 'can be damaged' do
      @weapon.impair_by(10)
      expect(@weapon.durability).to eq(40)
    end

    it 'can be repaired' do
      @weapon.durability = 40
      @weapon.repair_by(10)
      expect(@weapon.durability).to eq(50)
    end

    it 'cannot suffer more damages than 0' do
      @weapon.durability = 5
      @weapon.impair_by(10)
      expect(@weapon.durability).to eq(0)
    end

    it 'cannot be repaired to more than its maximum durability points' do
      @weapon.durability = 45
      @weapon.repair_by(10)
      expect(@weapon.durability).to eq(50)
    end
  end

  context 'when no attributes are given' do

    before do
      @weapon = weapon_class.new
      @weapon_class = weapon_class
    end

    it "has a default name" do
      expect(@weapon.name).to eq(@weapon_class::DEFAULTS[:name])
    end

    it "has a default attack bonus" do
      expect(@weapon.attack_bonus).to eq(@weapon_class::DEFAULTS[:attack_bonus])
    end

    it "has a default defense bonus" do
      expect(@weapon.defense_bonus).to eq(@weapon_class::DEFAULTS[:defense_bonus])
    end

    it "has a default durability" do
      expect(@weapon.durability).to eq(@weapon_class::DEFAULTS[:durability])
    end
  end
end

RSpec.describe 'Bare hands' do
  include_examples "weapons", BareHands
end

RSpec.describe 'A sword' do
  include_examples "weapons", Sword
end

RSpec.describe 'A two-hands axe' do
  include_examples "weapons", Axe
end

RSpec.describe 'A staff' do
  include_examples "weapons", Staff
end

RSpec.describe 'A spear' do
  include_examples "weapons", Spear
end

RSpec.describe 'A short sword' do
  include_examples "weapons", ShortSword 
end
