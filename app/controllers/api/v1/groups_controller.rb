class Api::V1::GroupsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def show
    @discussions = []
    Group.find(params[:id]).discussions.each do |discussion|
      discussion_to_send = {}
      discussion_to_send[:id] = discussion.id
      discussion_to_send[:title] = discussion.title
      discussion_to_send[:description] = discussion.description
      discussion_to_send[:rating] = discussion.rating
      @discussions << discussion_to_send
    end
    render json: { discussions: @discussions }
  end
end
