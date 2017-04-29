class MoviesController < ApplicationControllerdef

  def index
    @movies = Movie.all
  end
end
