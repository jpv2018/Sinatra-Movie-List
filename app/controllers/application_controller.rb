require './config/environment'

class ApplicationController < Sinatra::Base
  require 'sinatra/base'
  require 'sinatra/flash'
  
  set :method_override, true

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "Movie list"
    register Sinatra::Flash
  end

  get "/" do
    if is_logged_in?
      redirect to "/users/#{current_user.id}"
    else 
      erb :welcome
    end
  end

  def current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def is_logged_in?
    !!current_user
  end

  def no_login
    if !is_logged_in?
      flash[:error] = "You must be logged in to view this page"
      redirect to '/'
    end
  end

  def auth?(movie)
    movie.user == current_user
  end

end
