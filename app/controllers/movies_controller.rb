class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @user = current_user
  end

  def show
    @movie = Movie.find(params[:id])
    @user = current_user
  end

  def searchAPI
    @movies = Movie.all
    userinput = params[:userinput]
    userinput = userinput.split(' ').join('-')
    response = HTTParty.get("http://api-public.guidebox.com/v2/search?api_key=a24ffa38333a5845bfaee4f28cece621f4d51c93&type=movie&field=title&query=#{userinput}")
    json_response = JSON.parse(response.body)
    json_response["results"].each do |result|
      id = result["id"]
      movie_details = HTTParty.get("http://api-public.guidebox.com/v2/movies/#{id}\?api_key\=a24ffa38333a5845bfaee4f28cece621f4d51c93")
      json_movie_details = JSON.parse(movie_details.body)
      Movie.find_or_create_by!(title: result["title"]) do |movie|
        movie.image_url = result["poster_400x570"]
        movie.description = json_movie_details["overview"]
        movie.premiere_date = json_movie_details["release_date"]
        movie.source = json_movie_details["subscription_web_sources"]
        movie.display_name = json_movie_details["display_name"]
        movie.link = json_movie_details["link"]
      end
      movie = Movie.find_by(title: result["title"])
    end
  end
end
