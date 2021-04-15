require "player"

describe Player do
  let(:subject) { described_class.new("Mike", 60) }
  context "#name" do
    it "should return the name of the player" do
      expect(subject.name).to eq("Mike")
    end
  end

  context "#hp" do
    it "should have some HPs" do
      expect(subject.hp).to eq(60)
    end
  end

  context "#is_attacked" do
    it "should reduce the player's HP" do
      expect { subject.is_attacked }.to change { subject.hp }.by -10
    end
  end
end
