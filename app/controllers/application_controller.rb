require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "Movie list"
  end

  get "/" do
    if is_logged_in
      redirect to "/users/#{current_user.id}"
    erb :welcome
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def is_logged_in?
    !!curent_user
  end

  def no_login
    if !is_logged_in?
      redirect to '/'
    end
  end

end
