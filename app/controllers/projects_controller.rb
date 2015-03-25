class ProjectsController < ApplicationController
	before_action :set_project, only: [:edit, :update, :show, :destroy]

  def index
  	@project = current_project
  	@projects = Project.all 
  end

  def project_info
    @project = set_project
  end

  def show
    @project = Project.find(params[:id])
    @projects = current_project
    @room = Room.new

  end

  def edit
  	@project = current_project
  end

  def new
  	@project = Project.new
  end

  def create
  	@project = Project.new(project_params)
      if @project.save
    redirect_to admin_update_current_work_home_path
      else 
    redirect_to root_path
    end
  end

  def update
  		if @project.update(project_params)
  		redirect_to root_path
  	end
  end

  def destroy
  	@project.destroy
  	redirect_to admin_update_current_work_home_path
  end

  def new_project

  end

  private



  def set_project
  	@project = Project.find(params[:id])
  end

  def project_params
  	params.require(:project).permit(:name, :avatar)
  end

  def current_project
    session[:project_id] ? Project.find(session[:project_id]) :nil
  end

end
