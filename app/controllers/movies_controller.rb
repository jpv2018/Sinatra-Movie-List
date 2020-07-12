class MoviesController < ApplicationController

  set :method_override, true

  get "/movies" do
    erb :"/movies/index.html"
  end

  get "/movies/new" do
    erb :"/movies/new"
  end

  post "/movies" do
    @movie = Movie.new(title: params[:title], user_id: session[:user_id])
    @movie.save
    redirect to '/'
  end
    
  get "/movies/:id/edit" do
    no_login
    current_movie
    if auth?(@movie)
      erb :"/movies/edit"
    else
      redirect to '/'
    end  
  end

  patch "/movies/:id" do
    current_movie
    no_login
    if auth?(@movie) && params[:title] != ""
      @movie.update(title: params[:title])
      redirect to "/"
    else
      redirect to "/"
    end
  end

  def current_movie
    @movie = Movie.find(params[:id])
  end

  post "/movies/:id" do
    current_movie
    if auth?(@movie)
      @movie.delete
    redirect to "/"
    end
  end
end

