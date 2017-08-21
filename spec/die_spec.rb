require_relative '../die_class'

RSpec.shared_examples "dies" do |number_of_faces|
  before do
    @die = Die.new(number_of_faces)
  end

    it "has #{number_of_faces} faces" do
      expect(@die.faces).to eq(number_of_faces)
    end

    it "can roll" do
      expect(@die.roll).to be_between(1, number_of_faces).inclusive
    end

    it "can be rolled a number of times" do
      expect(@die.roll_times(3)).to be_between(3, number_of_faces * 3).inclusive
    end

    it "throws an error if player tries to throw zero times" do
      expect { @die.roll_times(0) }.to raise_error(CannotHaveZeroRollsError)
    end
end

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
    include_examples "dies", 4
  end

  context 'when initialized with 6 as argument' do
    include_examples "dies", 6
  end

  context 'when initialized with 8 as argument' do
    include_examples "dies", 8
  end

  context 'when initialized with 10 as argument' do
    include_examples "dies", 10
  end

  context 'when initialized with 12 as argument' do
    include_examples "dies", 12
  end

  context 'when initialized with 20 as argument' do
    include_examples "dies", 20
  end

  context 'when initialized with 100 as argument' do
    include_examples "dies", 100
  end
end
