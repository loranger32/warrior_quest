require_relative '../lib/game_class/game_class'

RSpec.shared_examples 'Fightable damage points method' do |character_class|
  let(:attacker) { character_class.new(name: 'attacker') }

  it "returns a positive integer" do
    expect(attacker.damage_points).to be_kind_of(Integer)
    expect(attacker.damage_points).to be > 0
  end

  it "returns integer >= to strength and weapon bonus points" do
    minimum_damage_points = attacker.strength + attacker.weapon.attack_bonus
    expect(attacker.damage_points).to be >= minimum_damage_points
  end

  it "returns integer >= to strength, weapon bonus and 2 dices throws (2)" do
    minimum_damage_points = 2
    minimum_damage_points += attacker.strength + attacker.weapon.attack_bonus
    expect(attacker.damage_points).to be >= minimum_damage_points
  end

  it "returns integer <= to strength, weapon bonus and 16 (2 dices(8))" do
    maximum_damage_points = 16
    maximum_damage_points += attacker.strength + attacker.weapon.attack_bonus
    expect(attacker.damage_points).to be <= maximum_damage_points
  end
end

RSpec.shared_examples 'Fightable defense points method' do |character_class|
  let(:defender) { character_class.new(name: 'defender') }

  it "returns a positive integer" do
    expect(defender.defense_points).to be_kind_of(Integer)
    expect(defender.defense_points).to be > 0
  end

  it "returns integer >= to agility and weapon defense bonus points" do
    minimum_defense_points = defender.agility + defender.weapon.defense_bonus
    expect(defender.defense_points).to be >= minimum_defense_points
  end

  it "returns integer >= to agility, weapon defense bonus and 1 (1 dice(4))" do
    minimum_defense_points = 1
    minimum_defense_points += defender.agility + defender.weapon.defense_bonus
    expect(defender.defense_points).to be >= minimum_defense_points
  end

  it "returns integer <= to agility, weapon defense bonus and 4 (1 dice(4))" do
    maximum_defense_points = 4
    maximum_defense_points += defender.agility + defender.weapon.defense_bonus
    expect(defender.defense_points).to be <= maximum_defense_points
  end
end

RSpec.shared_examples "Fightable attack method" do |character_class|
  let(:attacker) { character_class.new }
  let(:defender) { Squire.create('defender') }

  context 'with bare hands' do
    before { attacker.weapon = BareHands.new }

    it 'inflicts damages to defender if defense points < damage points' do
      expect(attacker.weapon).to be_instance_of(BareHands)
      allow(attacker).to receive(:damage_points).and_return(19)
      allow(defender).to receive(:defense_points).and_return(18)
      attacker.attack(defender)
      expect(defender.hp).to be < defender.max_hp
    end

    it 'do not inflicts damages if defense points >= damage points' do
      expect(attacker.weapon).to be_instance_of(BareHands)
      allow(attacker).to receive(:damage_points).and_return(18)
      allow(defender).to receive(:defense_points).and_return(19)
      attacker.attack(defender)
      expect(defender.hp).to eq(defender.max_hp)
    end

    it 'inflicts the correct amount of damages' do
      expect(attacker.weapon).to be_instance_of(BareHands)
      allow(attacker).to receive(:damage_points).and_return(29)
      allow(defender).to receive(:defense_points).and_return(19)
      attacker.attack(defender)
      expect(defender.hp).to eq(defender.max_hp - 10)
    end
  end
end

RSpec.describe 'Warrior Fighting Module' do
  include_examples "Fightable damage points method", Warrior
  include_examples "Fightable defense points method", Warrior
  include_examples "Fightable attack method", Warrior
end

RSpec.describe 'Wizard Fighting Module' do
  include_examples "Fightable damage points method", Wizard
  include_examples "Fightable defense points method", Wizard
  include_examples "Fightable attack method", Wizard
end

RSpec.describe 'Dwarf Fighting Module' do
  include_examples "Fightable damage points method", Dwarf
  include_examples "Fightable defense points method", Dwarf
  include_examples "Fightable attack method", Dwarf
end

RSpec.describe 'Elve Fighting Module' do
  include_examples "Fightable damage points method", Elve
  include_examples "Fightable defense points method", Elve
  include_examples "Fightable attack method", Elve
end

RSpec.describe 'Squire Fighting Module' do
  include_examples "Fightable damage points method", Squire
  include_examples "Fightable defense points method", Squire
  include_examples "Fightable attack method", Squire
end
