require_relative "player"

class Game
  attr_reader :player_1, :player_2, :current_player

  def initialize(player1 = Player.new, player2 = Player.new)
    @player_1 = player1
    @player_2 = player2
    @current_player = player_1
  end

  def attack(player)
    player.is_attacked
  end

  def switch_turn
    @current_player == player_1 ? @current_player = player_2 : @current_player
  end
end
