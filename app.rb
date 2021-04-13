require "sinatra"
require "sinatra/reloader"

class Battle < Sinatra::Base
  configure :develpoment do
    register Sinatra::Reloader
  end

  get "/" do
    "Testing Infrastructure working!"
  end

  run! if app_file == $0
end
