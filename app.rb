require "sinatra"
require "sinatra/reloader"
require_relative "lib/player"

class Battle < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    erb(:home)
  end

  post "/players" do
    $player_1 = Player.new(params[:player_1])
    $player_2 = Player.new(params[:player_2])
    redirect "/player_name"
  end

  get "/player_name" do
    @player_1 = $player_1
    @player_2 = $player_2
    erb(:players)
  end

  get "/attack" do
    @player_1 = $player_1
    @player_2 = $player_2
    Game.new(@player_1, @player_2).attack(@player_2)
    erb(:attack)
  end

  run! if app_file == $0
end
