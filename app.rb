require "sinatra"
require "sinatra/reloader"
require_relative "lib/player"
require_relative 'lib/game'

class Battle < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    erb(:home)
  end

  post "/players" do
    player_1 = Player.new(params[:player_1])
    player_2 = Player.new(params[:player_2])
    $game = Game.new(player_1, player_2)
    redirect "/player_name"
  end

  get "/player_name" do
    @game = $game
    erb(:players)
  end

  get "/attack" do
    @game = $game
    @game.attack(@game.player_2)
    @game.switch_turn
    erb(:attack)
  end

  run! if app_file == $0
end
