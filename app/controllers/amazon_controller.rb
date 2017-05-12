class AmazonController < ApplicationController
  def index
    @movies = Movie.all
    @user = current_user
  end

  def show
    @movie = Movie.find(params[:id])
    @user = current_user
  end
end
