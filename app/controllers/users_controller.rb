class UsersController < ApplicationController

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
      redirect to '/register'
    end
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    @phrase = "No movies yet!"
    erb :'/users/show'
  end

  post '/login' do
    @user = User.find_by(id: params[:user_id])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/users/#{@user.id}"
    else
      redirect to '/login'
    end
  end
end
