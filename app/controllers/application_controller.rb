require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "Movie list"
  end

  get "/" do
    erb :welcome
  end

  get "/login" do
    erb :login
  end
  
end
