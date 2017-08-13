require_relative '../die_class'

describe 'A die' do
  
  context 'when initialized with no argument' do

    before do
      @die = Die.new
    end

    it 'has 6 faces' do
      expect(@die.faces).to eq(6)
    end

    it 'can roll' do
      expect(@die.roll).to be_between(1, 6).inclusive
    end

    it 'can be rolled a number of times' do
      expect(@die.roll_times(3)).to be_between(3, 18).inclusive
    end

    it 'throws an error if player tries to throw zero times' do
      expect { @die.roll_times(0) }.to raise_error(CannotHaveZeroRollsError)
    end
  end

  context 'when initialized with 4 as argument' do

    before do
      @die_4 = Die.new(4)
    end

    it 'can have 4 faces' do
      expect(@die_4.faces).to eq(4)
    end

    it 'can roll' do
      expect(@die_4.roll).to be_between(1, 4).inclusive
    end

    it 'can be rolled a number of times' do
      expect(@die_4.roll_times(3)).to be_between(3, 12).inclusive
    end
  end

  context 'when initialized with 8 as argument' do

    before do
      @die_8 = Die.new(8)
    end

    it 'can have 8 faces' do
      expect(@die_8.faces).to eq(8)
    end

    it 'can roll' do
      expect(@die_8.roll).to be_between(1, 8).inclusive
    end

    it 'can be rolled a number of times' do
      expect(@die_8.roll_times(3)).to be_between(3, 24).inclusive
    end
  end

  context 'when initialized with 10 as argument' do

    before do
      @die_10 = Die.new(10)
    end

    it 'can have 10 faces' do
      expect(@die_10.faces).to eq(10)
    end

    it 'can roll' do
      expect(@die_10.roll).to be_between(1, 10).inclusive
    end

    it 'can be rolled a number of times' do
      expect(@die_10.roll_times(3)).to be_between(3, 30).inclusive
    end
  end

  context 'when initialized with 12 as argument' do

    before do
      @die_12 = Die.new(12)
    end

    it 'can have 12 faces' do
      expect(@die_12.faces).to eq(12)
    end

    it 'can roll' do
      expect(@die_12.roll).to be_between(1, 12).inclusive
    end

    it 'can be rolled a number of times' do
      expect(@die_12.roll_times(3)).to be_between(3, 36).inclusive
    end
  end

  context 'when initialized with 20 as argument' do

    before do
      @die_20 = Die.new(20)
    end

    it 'can have 20 faces' do
      expect(@die_20.faces).to eq(20)
    end

    it 'can roll' do
      expect(@die_20.roll).to be_between(1, 20).inclusive
    end

    it 'can be rolled a number of times' do
      expect(@die_20.roll_times(3)).to be_between(3, 60).inclusive
    end
  end

  context 'when initialized with 100 as argument' do

    before do
      @die_100 = Die.new(100)
    end

    it 'can have 100 faces' do
      expect(@die_100.faces).to eq(100)
    end

    it 'can roll' do
      expect(@die_100.roll).to be_between(1, 100).inclusive
    end

    it 'can be rolled a number of times' do
      expect(@die_100.roll_times(3)).to be_between(3, 300).inclusive
    end
  end


end
