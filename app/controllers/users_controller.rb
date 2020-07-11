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
      redirect to "/users/#{@user.id}"
    else
      redirect to '/register'
    end
end
