# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

response = HTTParty.get('http://api-public.guidebox.com/v2/movies?api_key=a24ffa38333a5845bfaee4f28cece621f4d51c93&limit=250')
json_response = JSON.parse(response.body)
json_response["results"].each do |result|
  puts "Adding movie to db..."
  id = result["id"]
  movie_details = HTTParty.get("http://api-public.guidebox.com/v2/movies/#{id}\?api_key\=a24ffa38333a5845bfaee4f28cece621f4d51c93")
  json_movie_details = JSON.parse(movie_details.body)
  Movie.find_or_create_by!(title: result["title"]) do |movie|
    movie.image_url = result["poster_400x570"]
    puts "Movie added to db."
  end

  movie = Movie.find_by(title: result["title"])
  movie.description = json_movie_details["overview"]
  movie.premiere_date = json_movie_details["release_date"]
  movie.source = json_movie_details["subscription_web_sources"]
  movie.display_name = json_movie_details["display_name"]
  movie.link = json_movie_details["link"]
  if movie.save!
    puts "Movie #{movie.id} updated!"
  end
end
