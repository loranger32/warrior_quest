require_relative '../lib/game_class/game_class'

RSpec.shared_examples 'Fightable damage points method' do |character_class|
  before do
    @attacker = character_class.new(name: 'attacker')
    @defender = Squire.create('defender')
  end

  it "returns a positive integer" do
    expect(@attacker.damage_points).to be_kind_of(Integer)
    expect(@attacker.damage_points).to be > 0
  end

  it "returns integer >= to strength and weapon bonus points" do
    minimum_damage_points = @attacker.strength + @attacker.weapon.attack_bonus
    expect(@attacker.damage_points).to be >= minimum_damage_points
  end

  it "returns integer >= to strength, weapon bonus and 2 dices throws (2)" do
    minimum_damage_points = 2
    minimum_damage_points += @attacker.strength + @attacker.weapon.attack_bonus
    expect(@attacker.damage_points).to be >= minimum_damage_points
  end

  it "returns integer <= to strength, weapon bonus and 16 (2 dices(8))" do
    maximum_damage_points = 16
    maximum_damage_points += @attacker.strength + @attacker.weapon.attack_bonus
    expect(@attacker.damage_points).to be <= maximum_damage_points
  end
end

RSpec.shared_examples "Fightable" do |character_class|
  it "is ok" do
    expect(1).to eq(1)
  end

  context 'when attacking with bare hands' do
    
    before do
      @attacker = character_class.new(name: 'attacker')
      @defender = Squire.new(name: 'defender squire')
    end

    it 'reduces hp points of the defender accordingly' do
      expect(@defender.hp).to eq(85)
      @attacker.attack(@defender)
      expect(@defender.hp).to be_between(61, 75)
    end
  end
end

describe 'Warrior' do
  include_examples "Fightable damage points method", Warrior
  # include_examples "Fightable", Warrior
end

describe 'Wizard' do
  include_examples "Fightable damage points method", Wizard
  # include_examples "Fightable", Wizard
end

describe 'Dwarf' do
  include_examples "Fightable damage points method", Dwarf
  # include_examples "Fightable", Dwarf
end

describe 'Elve' do
  include_examples "Fightable damage points method", Elve
  # include_examples "Fightable", Elve
end

describe 'Squire' do
  include_examples "Fightable damage points method", Squire
  # include_examples "Fightable", Squire
end
