class ListsController < ApplicationController
  include HTTParty

  def search
    response = http://api-public.guidebox.com/v2/search?api_key=a24ffa38333a5845bfaee4f28cece621f4d51c93&type=movie&field=title&query=, {body: [query]}
  end
end
