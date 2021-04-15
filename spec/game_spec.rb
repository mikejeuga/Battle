require "game"

describe Game do
  let(:mike) { double :player, name: "Mike", hp: 10 }
  let(:jason) { double :player, name: "Jason", hp: 10 }
  let(:subject) { described_class.new(mike, jason) }

  context "#initialize" do
    it "should have players" do
      expect(subject.player_1.name).to eq("Mike")
    end

    it "should have players" do
      expect(subject.player_2.name).to eq("Jason")
    end
  end

  context "#attack" do
    it "should reduce the player's HP" do
      game = Game.new(mike, jason)
      expect(mike).to receive(:is_attacked).and_return(50)
      subject.attack(mike)
    end
  end
end
