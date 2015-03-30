class RoomsController < ApplicationController
  before_action :set_room, only: [:edit, :update, :show, :destroy]

  def index
    @room = current_room
    @rooms = Room.all 
  end

  def show
    @current_user = current_user
    @rooms = set_room
    @projects = set_project
  end

  def edit
    @room = current_room
  end

  def new
    @room = Room.new
    respond_to do |format|
      format.js
    end
  end

  def create
    project = set_project
    p current_project
    @room = Room.new(room_params)
      respond_to do |format|
        if @room.save
          format.html { redirect_to :back }
        else 
          format.html{redirect_to "/project_info/#{project.id}" }
          format.js
          
        end
      end
  end

  def update
      if @room.update(room_params)
      redirect_to root_path
    end
  end

  def destroy
    project = set_project
    @room.destroy
    redirect_to "/project_info/#{project.id}"
  end


  private
  def current_user
    session[:user_id] ? User.find(session[:user_id]) :nil
  end

  def current_project
    session[:project_id] ? Project.find(session[:project_id]) :nil
  end

  def set_room
    @room = Room.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def room_params
    params.require(:room).permit(:name, :path_height, :path_width, :path_top, :path_left, :project_id)
  end

  def current_room
    session[:room_id] ? Room.find(session[:room_id]) :nil
  end

end
