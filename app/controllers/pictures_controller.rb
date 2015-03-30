class PicturesController < ApplicationController
  before_action :set_picture, only: [:edit, :update, :show, :destroy]

  def index
    @room = set_room
    @project = set_project
  end

  def show
  end

  def edit
    @picture = current_picture
  end

  def new
    @current_user = current_user
    @room = set_room
    @project = set_project
    @picture = Picture.new
  end

  def create
    @room = set_room
    @project = set_project
    @picture = Picture.new(picture_params)
    @picture.room = @room
      if @picture.save    
    redirect_to project_room_path(@project, @room)
      else 
    redirect_to project_room_path(@project, @room)
    end
  end

  def update
      if @picture.update(picture_params)
      redirect_to root_path
    end
  end

  def destroy
    @picture.destroy
    @room = set_room
    @project = set_project
    redirect_to project_room_path(@project, @room)
  end

  private
  def current_user
    session[:user_id] ? User.find(session[:user_id]) :nil
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:image)
  end

  def current_picture
    session[:picture_id] ? Picture.find(session[:picture_id]) :nil
  end

end
