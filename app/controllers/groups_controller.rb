class GroupsController < ApplicationController

  def index
    @groups = Group.all.order("created_at DESC")
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    if current_user.present?
      @group = Group.new
    else
      flash[:alert] = "Please log in before trying to submit a group!"
      redirect_to root_path
    end
  end

  def create
    @group = Group.new(group_params)
    @group.user= current_user
    group_owner = @group.user
    if @group.save
      redirect_to group_path(@group)
    else
      @errors = @group.errors.full_messages
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update_attributes(group_params)
    if @group.save
      flash[:success] = 'group successfully edited!'
      redirect_to group_path(@group)
    else
      @errors = @group.errors.full_messages
      render :new
    end
  end

  def destroy
      @group = Group.find(params[:id])
      @group.destroy
      flash[:success] = "group deleted"
      redirect_to root_path
      end
  end

  private

  def group_params
    params.require(:group).permit(:title, :movie_id, :description)
  end
