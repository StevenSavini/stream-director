class Api::V1::SearchesController < ApplicationController
  require 'net/http'
  require 'json'
  require 'date'
  require 'dotenv'
  require 'uri'

    def index
      uri = URI("http://api-public.guidebox.com/v2/search?api_key=a24ffa38333a5845bfaee4f28cece621f4d51c93&type=movie&field=title&query="+query)
      uri.query = URI.encode_www_form(params)
        data = get_response(uri)
      respond_with data
    end

    def create
      query = URI.encode(query_params["query"])
      uri = URI("http://api-public.guidebox.com/v2/search?api_key=a24ffa38333a5845bfaee4f28cece621f4d51c93&type=movie&field=title&query="+query)
      uri.query = URI.encode_www_form(params)
      res = Net::HTTP.get_response(uri)
      data = JSON.parse(res.body)
      filtered_titles = data[0, 48]
      render :json => filtered_titles
    end

    private

    def query_params
      params.require(:guideboxapi).permit(
        :query
      )
    end

    def get_response(uri)
      res = Net::HTTP.get_response(uri)
      data = JSON.parse(res.body)
    end
  end
