class MoviesController < ApplicationController

  # GET: /movies
  get "/movies" do
    erb :"/movies/index.html"
  end

  # GET: /movies/new
  get "/movies/new" do
    erb :"/movies/new"
  end

  # POST: /movies
  post "/movies" do
    @movie = Movie.new(title: params[:title], user_id: session[:user_id])
    @movie.save
    redirect to '/'
  end

  # GET: /movies/5
  get "/movies/:id" do
    erb :"/movies/show.html"
  end

  # GET: /movies/5/edit
  get "/movies/:id/edit" do
    erb :"/movies/edit.html"
  end

  # PATCH: /movies/5
  patch "/movies/:id" do
    redirect "/movies/:id"
  end

  # DELETE: /movies/5/delete
  delete "/movies/:id/delete" do
    redirect "/movies"
  end

end
