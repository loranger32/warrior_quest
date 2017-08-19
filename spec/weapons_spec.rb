require_relative '../character_class'
require_relative '../weapons_class'

RSpec.shared_examples "weapons" do |weapon_class|

  
  context 'when attributes are given' do
    before do
    @weapon = weapon_class.new(name: 'arme', attack_bonus: 15, defense_bonus: 5,
      durability: 50)
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

describe 'A weapon' do
  include_examples "weapons", Weapon
end

describe 'Bare hands' do
  include_examples "weapons", BareHands
end

describe 'A sword' do
  include_examples "weapons", Sword
end

describe 'A two-hands axe' do
  include_examples "weapons", Axe
end

describe 'A staff' do
  include_examples "weapons", Staff
end

describe 'A spear' do
  include_examples "weapons", Spear
end

describe 'A short sword' do
  include_examples "weapons", ShortSword 
end
