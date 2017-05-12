class Guidebox

  def searchAPI
    userinput = params[:userinput]
    userinput = userinput.split(' ').join('-')
    guidebox_request = HTTParty.get("http://api-public.guidebox.com/v2/search?api_key=a24ffa38333a5845bfaee4f28cece621f4d51c93&type=movie&field=title&query=#{userinput}")
    @movie_info = guidebox_request["results"].first
    # @trailer = guidebox_request["results"]["trailers"]
    @movie_info

  end
end
