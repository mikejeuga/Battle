require "sinatra"
require "sinatra/reloader"

class Battle < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    erb(:home)
  end

  post "/players" do
    session[:player_1] = params[:player_1]
    session[:player_2] = params[:player_2]
    redirect "/player_name"
  end

  get "/player_name" do
    @player_1 = session[:player_1]
    @player_2 = session[:player_2]
    erb(:players)
  end

  run! if app_file == $0
end
