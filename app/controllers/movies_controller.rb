class MoviesController < ApplicationController
  def index
  end

  def show
    authorize Movie

    tmdb_id = params[:id]
    
    @movie = Movie.find_or_create_by(tmdb_id: tmdb_id) do |movie|
      url = "https://api.themoviedb.org/3/movie/#{tmdb_id}?api_key=#{Rails.application.credentials.tmdb_api}"
      response = HTTP.get(url)
      data = JSON.parse(response.to_s, symbolize_names: true)
      
      movie.tmdb_id = data[:id]
      movie.title = data[:title]
      movie.release_date = data[:release_date]
      movie.runtime = data[:runtime]
      movie.raw_data = data
    end

  end

  def search
    authorize Movie
    @movies = []

    if params[:query]
      url = "https://api.themoviedb.org/3/search/movie?query=#{CGI::escape(params[:query])}&api_key=#{Rails.application.credentials.tmdb_api}"
      response = HTTP.get(url) 

      @movies = JSON.parse(response.to_s, symbolize_names: true)[:results]
    end
  end
end
