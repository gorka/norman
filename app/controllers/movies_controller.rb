class MoviesController < ApplicationController
  def index
  end

  def show
  end

  def search
    @movies = []

    if params[:query]
      url = "https://api.themoviedb.org/3/search/movie?query=#{CGI::escape(params[:query])}&api_key=#{Rails.application.credentials.tmdb_api}"
      response = HTTP.get(url) 

      @movies = JSON.parse(response.to_s, symbolize_names: true)[:results]
    end
  end
end
