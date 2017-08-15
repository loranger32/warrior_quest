require_relative '../character_class'
require_relative '../weapons_class'

describe 'A weapon' do

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

    it 'has a max durability points attribute' do
      expect(@weapon.max_durability).to eq(@weapon.durability)
    end

    it 'cannot change its max durability attribute' do
      expect { @weapon.max_durability = 20 }.to raise_error(NoMethodError)
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
end

describe 'Bare hands' do

  before do
    @bare_hands = BareHands.new
  end

  it 'has a name' do
    expect(@bare_hands.name).to eq('Mains nues')
  end

  it 'has a default attack bonus' do
    expect(@bare_hands.attack_bonus).to eq(0)
  end

  it 'has a default defense bonus' do
    expect(@bare_hands.defense_bonus).to eq(0)
  end

  it 'has a default durability' do
    expect(@bare_hands.durability).to eq(200)
  end

  it 'can be damaged' do
    @bare_hands.impair_by(10)
    expect(@bare_hands.durability).to eq(190)
  end

  it 'can be repaired' do
    @bare_hands.durability = 40
    @bare_hands.repair_by(10)
    expect(@bare_hands.durability).to eq(50)
  end

  it 'cannot suffer damages if durability is lesser or equal to 0' do
    @bare_hands.durability = 5
    @bare_hands.impair_by(10)
    expect(@bare_hands.durability).to eq(0)
  end

  it 'cannot be repaired to more than its maximum durability points' do
    @bare_hands.repair_by(10)
    expect(@bare_hands.durability).to eq(200)
  end
end

describe 'A sword' do
  
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

  it 'can be damaged' do
    @sword.impair_by(10)
    expect(@sword.durability).to eq(40)
  end

  it 'can be repaired' do
    @sword.durability = 40
    @sword.repair_by(10)
    expect(@sword.durability).to eq(50)
  end

  it 'cannot suffer damages if durability is lesser or equal to 0' do
    @sword.durability = 5
    @sword.impair_by(10)
    expect(@sword.durability).to eq(0)
  end

  it 'cannot be repaired to more than its maximum durability points' do
    @sword.durability = 45
    @sword.repair_by(10)
    expect(@sword.durability).to eq(50)
  end
end

describe 'A two-hands axe' do
  
  before do
    @axe = Axe.new
  end

  it 'and have a name' do
    expect(@axe.name).to eq('Hache à deux mains')
  end

  it 'and have a default attack bonus' do
    expect(@axe.attack_bonus).to eq(30)
  end

  it 'and have a default defense bonus' do
    expect(@axe.defense_bonus).to eq(10)
  end

  it 'and have a default durability' do
    expect(@axe.durability).to eq(80)
  end

  it 'can be damaged' do
    @axe.impair_by(10)
    expect(@axe.durability).to eq(70)
  end

  it 'can be repaired' do
    @axe.durability = 70
    @axe.repair_by(10)
    expect(@axe.durability).to eq(80)
  end

  it 'cannot suffer damages if durability is lesser or equal to 0' do
    @axe.durability = 5
    @axe.impair_by(10)
    expect(@axe.durability).to eq(0)
  end

  it 'cannot be repaired to more than its maximum durability points' do
    @axe.durability = 75
    @axe.repair_by(10)
    expect(@axe.durability).to eq(80)
  end
end

describe 'A staff' do
  
  before do
    @staff = Staff.new
  end

  it 'and have a name' do
    expect(@staff.name).to eq('Baton')
  end

  it 'and have a default attack bonus' do
    expect(@staff.attack_bonus).to eq(5)
  end

  it 'and have a default defense bonus' do
    expect(@staff.defense_bonus).to eq(5)
  end

  it 'and have a default durability' do
    expect(@staff.durability).to eq(30)
  end

  it 'can be damaged' do
    @staff.impair_by(10)
    expect(@staff.durability).to eq(20)
  end

  it 'can be repaired' do
    @staff.durability = 20
    @staff.repair_by(10)
    expect(@staff.durability).to eq(30)
  end

  it 'cannot suffer damages if durability is lesser or equal to 0' do
    @staff.durability = 5
    @staff.impair_by(10)
    expect(@staff.durability).to eq(0)
  end

  it 'cannot be repaired to more than its maximum durability points' do
    @staff.durability = 25
    @staff.repair_by(10)
    expect(@staff.durability).to eq(30)
  end
end

describe 'A spear' do
  
  before do
    @spear = Spear.new
  end

  it 'and have a name' do
    expect(@spear.name).to eq('Lance')
  end

  it 'and have a default attack bonus' do
    expect(@spear.attack_bonus).to eq(20)
  end

  it 'and have a default defense bonus' do
    expect(@spear.defense_bonus).to eq(20)
  end

  it 'and have a default durability' do
    expect(@spear.durability).to eq(100)
  end

  it 'can be damaged' do
    @spear.impair_by(10)
    expect(@spear.durability).to eq(90)
  end

  it 'can be repaired' do
    @spear.durability = 90
    @spear.repair_by(10)
    expect(@spear.durability).to eq(100)
  end

  it 'cannot suffer damages if durability is lesser or equal to 0' do
    @spear.durability = 5
    @spear.impair_by(10)
    expect(@spear.durability).to eq(0)
  end

  it 'cannot be repaired to more than its maximum durability points' do
    @spear.durability = 95
    @spear.repair_by(10)
    expect(@spear.durability).to eq(100)
  end
end

describe 'A short sword' do
  
  before do
    @short_sword = ShortSword.new
  end

  it 'and have a name' do
    expect(@short_sword.name).to eq('Dague')
  end

  it 'and have a default attack bonus' do
    expect(@short_sword.attack_bonus).to eq(10)
  end

  it 'and have a default defense bonus' do
    expect(@short_sword.defense_bonus).to eq(5)
  end

  it 'and have a default durability' do
    expect(@short_sword.durability).to eq(50)
  end

  it 'can be damaged' do
    @short_sword.impair_by(10)
    expect(@short_sword.durability).to eq(40)
  end

  it 'can be repaired' do
    @short_sword.durability = 40
    @short_sword.repair_by(10)
    expect(@short_sword.durability).to eq(50)
  end

  it 'cannot suffer damages if durability is lesser or equal to 0' do
    @short_sword.durability = 5
    @short_sword.impair_by(10)
    expect(@short_sword.durability).to eq(0)
  end

  it 'cannot be repaired to more than its maximum durability points' do
    @short_sword.durability = 45
    @short_sword.repair_by(10)
    expect(@short_sword.durability).to eq(50)
  end
end
