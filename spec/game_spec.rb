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
      expect(mike).to receive(:is_attacked).and_return(50)
      subject.attack(mike)
    end
  end

  context '#current_player' do
    it 'begins a player one' do
      expect(subject.current_player).to eq subject.player_1
    end
  end

  context '#switch_turn' do
    it 'switches the turn' do
      expect{ subject.switch_turn }.to change{ subject.current_player }.to subject.player_2
    end
  end
end
