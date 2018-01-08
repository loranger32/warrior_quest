require_relative '../lib/game_class/game_class'

RSpec.describe 'Validable' do
  context "in its generic form" do
    it "raises an exception if valid choices list is not an array" do
      expect { Validable.valid_choice?('n', 'n', 'b', 's') }
        .to raise_error(ArgumentError)
    end

    it "spots invalid choices" do
      expect(Validable.valid_choice?('n', ['a', 'b', 'c'])).to be false
    end

    it "spots valid choices" do
      expect(Validable.valid_choice?('n', ['a', 'b', 'c', 'n'])).to be true
    end

    it "spots valid choices even if uppercased" do
      expect(Validable.valid_choice?('N', ['a', 'b', 'c', 'n'])).to be true
    end
  end

  context "spots invalid name input and" do
    it "rejects empty names" do
      expect(Validable.valid_name?('   ')).to be false
    end

    it "rejects names with a trailing whitespace" do
      expect(Validable.valid_name?('Aragorn  ')).to be false
    end

    it "rejects names with a newline in it" do
      expect(Validable.valid_name?("hello\nworld")).to be false
    end

    it "rejects names with numbers in it" do
      expect(Validable.valid_name?('Aragorn 2')).to be false
    end

    it "rejects names with more than two spaces in a row in it" do
      expect(Validable.valid_name?('Aragorn  the first')).to be false
    end
  end

  context "spots valid name input and" do
    it "accepts names composes of only letters" do
      expect(Validable.valid_name?('aragaron')).to be true
    end

    it "accepts names composed with uppercase letters" do
      expect(Validable.valid_name?('Aragorn')).to be true
      expect(Validable.valid_name?('ARAGORN')).to be true
    end

    it "accepts names composed with numbers in roman form" do
      expect(Validable.valid_name?('AragornII')).to be true
    end

    it "accepts names with only one space in a row" do
      expect(Validable.valid_name?('Aragorn Arwen')).to be true
      expect(Validable.valid_name?('Aragorn the brave')).to be true
    end
  end

  context "spots invalid game choices" do
    it "rejects invalid game choices" do
      expect(Validable.valid_game_choice?('w')).to be false
      expect(Validable.valid_game_choice?('a')).to be false
      expect(Validable.valid_game_choice?('/')).to be false
    end
  end

  context "spots valid game choices" do
    it "accepts valid game choices" do
      Validable::VALID_GAME_CHOICES.each do |choice|
        expect(Validable.valid_game_choice?(choice)).to be true
      end
    end
  end
end
