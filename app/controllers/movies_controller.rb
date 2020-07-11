class MoviesController < ApplicationController

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

  get "/movies/:id" do
    current_movie
    erb :"/movies/show"
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
    redirect "/movies/:id"
  end

  delete "/movies/:id/delete" do
    redirect "/movies"
  end

  def current_movie
    @movie = Movie.find(params[:id])
  end
  

end
