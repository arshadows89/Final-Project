class RoomsController < ApplicationController
	before_action :set_room, only: [:edit, :update, :show, :destroy]

  def index
  	@room = current_room
  	@rooms = Room.all 
  end

  def show
    @rooms = current_room
    
  end

  def edit
  	@room = current_room
  end

  def new
  	@room = Room.new
  end

  def create
    p current_project
  	@room = Room.new(room_params)
    respond_to do |format|
      format.html{
        if @room.save
          render project_path
        else 
          
        end
      }
      format.js
    end
  end

  def update
  		if @room.update(room_params)
  		redirect_to root_path
  	end
  end

  def destroy
  	@room.destroy
  	redirect_to root_path
  end


  private

  def current_project
    session[:project_id] ? Project.find(session[:project_id]) :nil
  end

  def set_room
  	@room = Room.find(params[:id])
  end


  def room_params
  	params.require(:room).permit(:name, :path, :project_id)
  end

  def current_room
    session[:room_id] ? Room.find(session[:room_id]) :nil
  end

end
