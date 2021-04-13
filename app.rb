require "sinatra"
require "sinatra/reloader"

class Battle < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    erb(:home)
  end

  post '/players' do
    @player_1 = params[:player_1]
    @player_2 = params[:player_2]
    erb(:players)
  end

  run! if app_file == $0
end
