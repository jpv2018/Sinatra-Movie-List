class UsersController < ApplicationController

  set :method_override, true

  get '/login' do
    erb :login
  end

  get '/register' do
    erb :register
  end

  post '/users' do
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      redirect to "/users/#{@user.id}"
    else
      flash[:error] = "Oops! #{@user.errors.full_messages.to_sentence}. Please try something else."
      redirect to '/register'
    end
  end

  get '/users/:id' do
    no_login
    @user = User.find(params[:id])
    @phrase = "No movies yet!"
    erb :'/users/show'
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/users/#{@user.id}"
    else
      flash[:error] = "Incorrect Username or Password. Please try again."
      redirect to '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end

end
