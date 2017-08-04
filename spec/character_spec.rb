require_relative '../Character_class.rb'

describe Character do

  before do
    $stdout = StringIO.new
    @character = Character.new(name: "Laurent", hp: 120, strength: 12, 
                               spirit: 12, agility: 12)
  end

    it "has a capitalized name" do
      expect(@character.name).to eq("Laurent")
    end

    it "has hp points" do
      expect(@character.hp).to eq(120)
    end

    it "has spirit points" do
      expect(@character.spirit).to eq(12)
    end

    it "has agility points" do
      expect(@character.agility).to eq(12)
    end
end
