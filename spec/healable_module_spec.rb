require_relative '../lib/game_class/game_class'

RSpec.describe "Healable" do
  context "when healed player is already at max hp" do
    before do
      @player = Warrior.new
      @other_player = Squire.new
    end

    it "doesn't give more hp point to player than its max hp" do
      max_hp = @player.max_hp
      @player.heal_self
      expect(@player.hp).to eq(max_hp)
    end

    it "doesn't give more hp point to other player tha its max hp" do
      max_hp = @other_player.max_hp
      @player.heal(@other_player)
      expect(@other_player.hp).to eq(max_hp)
    end
  end

  context "when healed player needs more hp than what spell can provide" do
    before do
      @player = Warrior.new
      @other_player = Squire.new
      @player.hp -= Healable::SIMPLE_HEAL + 20
      @other_player.hp -= Healable::SIMPLE_HEAL + 20
    end

    it "does restore all player's hp provided by the spell" do
      max_hp = @player.max_hp
      @player.heal_self
      expect(@player.hp).to eq(max_hp - 50 + Healable::SIMPLE_HEAL)
    end

    it "does restore all other player's hp provided by the spell" do
      max_hp = @other_player.max_hp
      @player.heal(@other_player)
      expect(@other_player.hp).to eq(max_hp - 50 + Healable::SIMPLE_HEAL)
    end
  end

  context "when heald player has only lost a few hp points" do
    before do
      @player = Warrior.new
      @other_player = Squire.new
      @player.hp -= Healable::SIMPLE_HEAL - 10
      @other_player.hp -= Healable::SIMPLE_HEAL - 10
    end
    it "doesn't give more hp point to player than its max hp" do
      max_hp = @player.max_hp
      @player.heal_self
      expect(@player.hp).to eq(max_hp)
    end

    it "doesn't give more hp point to other player than its max hp" do
      max_hp = @other_player.max_hp
      @player.heal(@other_player)
      expect(@other_player.hp).to eq(max_hp)
    end
  end
end
