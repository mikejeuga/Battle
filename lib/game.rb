require_relative "player"

class Game
  attr_reader :player_1, :player_2
  attr_accessor :current_player, :target

  def initialize(player1 = Player.new, player2 = Player.new)
    @player_1 = player1
    @player_2 = player2
    @current_player = player_1
    @target = player_2
  end

  def attack(player)
    player.is_attacked
  end

  def switch_turn
    if @current_player == player_1
      @target = player_1
      @current_player = player_2
    end
  end
end
