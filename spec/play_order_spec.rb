require_relative '../lib/game_class/play_order_class'

RSpec.describe PlayOrder do
  let(:player) { Warrior.new(name: 'Warrior',  agility: 15) }
  let(:wizard) { Wizard.new(name: 'Wizard', agility: 7) }
  let(:dwarf)  { Dwarf.new(name: 'Dwarf', agility: 18) }
  let(:elve)   { Elve.new(name: 'Elve', agility: 12) }
  let(:teamates) { [wizard, dwarf, elve] }

  let(:opponents) do
    [Squire.create('Baranabé'), Squire.create('Raymond')]
  end

  let(:playorder) { PlayOrder.new(player, teamates, opponents) }

  context "responds to" do
    it "#characters methods" do
      expect(playorder).to respond_to(:characters)
    end

    it "#order! method" do
      expect(playorder).to respond_to(:order!)
    end

    it "#each method" do
      expect(playorder).to respond_to(:each)
    end
  end

  context "when correctly initialized" do
    it 'returns an array when #characters is called on it' do
      expect(playorder.characters).to be_kind_of(Array)
    end

    it 'correctly implements the each method and Enumerable module' do
      expect(playorder.first).to be(player)
    end

    it 'returns an array of objects that respond to #agility' do
      playorder.each do
       |char| expect(char).to respond_to(:agility)
      end
    end

    it 'is not sorted by default' do
      expect(playorder.first.agility).to eq(15)
    end

    it 'is sorted from higher to lower agility when #order! is called on it' do
      playorder.order!
      expect(playorder.first.agility).to eq(18)
    end
  end

  context "If an object that does not respond to #agility is added as argument" do
  let(:sword) { instance_double('Sword') }

    it "throws an error" do  
      opponents << sword
      expect {PlayOrder.new(player, teamates, opponents) }.to raise_error(ArgumentError)
    end
  end
 
  context 'it throws an ArgumentError if' do
    it 'the first argument is not a warrior' do
      expect { PlayOrder.new(dwarf, teamates, opponents) }. to raise_error(ArgumentError)
    end

    it 'the second argument is not an array of Character subclasses' do
      expect { PlayOrder.new(player, dwarf, opponents) }. to raise_error(ArgumentError)
    end

    it 'the third argument is not an array of Character subclasses' do
      expect { PlayOrder.new(player, teamates, dwarf) }.to raise_error(ArgumentError)
    end
  end
end
