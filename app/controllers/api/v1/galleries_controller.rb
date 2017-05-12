def get_movie(list)
  movie_list = []
  list.each do |movie_id|
    movie_hash = {}

    movie = Movie.find_by movie_id: movie_id

      query = movie_id.to_s

      uri = URI("http://api-public.guidebox.com/v2/search?api_key=a24ffa38333a5845bfaee4f28cece621f4d51c93&type=movie&field=title&query=" + query)
      uri.query = URI.encode_www_form(params)
      res = Net::HTTP.get_response(uri)
      data = JSON.parse(res.body)

      new_description = (data["description"]) ?
        new_description = data["description"].gsub("<br>", "") :
        new_description = "not available"

      Movie.create(
        movie_id: data["id"],
        title: data["title"],
        image_url: data["image_url_med"],
        description: newDescription
      )
    end

    movie_hash["object"] = movie
    movie_list.push(movie_hash)
  end
  movie_list
end

def get_matches(list)
  matches_list = []
  list.each do |match|
    match_hash = {}
    matches_list.push(match_hash)
  end
  matches_list
end
