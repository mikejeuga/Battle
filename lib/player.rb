class Player
  attr_reader :name, :hp

  def initialize(name, hp = 60)
    @name = name
    @hp = hp
  end

  def is_attacked
    @hp -= 10
  end
end
