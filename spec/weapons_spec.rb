require_relative '../weapons_class'

describe 'A weapon' do

  # context 'when not specified' do
    
  #   before do
  #     @weapon = Weapon.new()
  #   end

  #   it 'throws errors when trying to call method on it' do
  #     expect {@weapon.name}.to raise_error(WeaponMustBeSubclassedError)
  #     expect {@weapon.attack_bonus}.to raise_error(WeaponMustBeSubclassedError)
  #     expect {@weapon.defense_bonus}.to raise_error(WeaponMustBeSubclassedError)
  #     expect {@weapon.durability}.to raise_error(WeaponMustBeSubclassedError)
  #   end

  # end

  context 'when attributes are given' do

    before do
      @weapon = Weapon.new(name: 'épée', attack_bonus: 15, defense_bonus: 5,
        durability: 50)
    end

    it 'has a name' do
      expect(@weapon.name).to eq('épée')
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
  end

  context 'in action' do

    before do
      @weapon = Weapon.new(name: 'épée', attack_bonus: 15, defense_bonus: 5,
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

    it 'cannot suffer damages if durability is lesser or equal to 0' do
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

  context 'can be a sword'do

    before do
      @sword = Sword.new
    end

    it 'and have a name' do
      expect(@sword.name).to eq('Epée')
    end

    it 'and have a default attack bonus' do
      expect(@sword.attack_bonus).to eq(15)
    end

    it 'and have a default defense bonus' do
      expect(@sword.defense_bonus).to eq(5)
    end

    it 'and have a default durability' do
      expect(@sword.durability).to eq(50)
    end
  end
end
