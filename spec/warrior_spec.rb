require_relative '../warrior_class'

RSpec.describe "A warrior" do
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
