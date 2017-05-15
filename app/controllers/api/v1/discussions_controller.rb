class Api::V1::DiscussionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :destory, :update]

  def new
    @discussion = Discussion.new
  end

  def create
    discussion = Discussion.new(discussion_params)
    group = Group.find(discussion_params['group_id'])
    discussion.user = current_user
    if discussion.save
      flash[:notice] = "Post added successfully"
      discussion_to_send = {}
      discussion_to_send[:id] = discussion.id
      discussion_to_send[:title] = discussion.title
      discussion_to_send[:description] = discussion.description
      discussion_to_send[:created_at] = discussion.created_at
      render json: {
       status: 201,
       message: ("successfully created a post"),
       discussion: discussion_to_send
      }.to_json
    else
      render json: {
        status: 500,
        error: discussion.errors
      }.to_json
    end
  end

  private

  def discussion_params
    params.require(:discussion).permit(:title, :description, :group_id)
  end
end
