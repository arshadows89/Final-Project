class HomeController < ApplicationController
  protect_from_forgery
  def index

  end

  def admin_login

  end

  def admin_home

  end

  def admin_update_contact
    @contact = Contact.new
  end

  def admin_update_contact_info_post
    @contact = Contact.last.update(contact_params)
    redirect_to admin_home_path
  end

  def admin_update_past_work

  end

  def admin_update_current_work
  	@project = Project.new
  end

  def admin_update_current_work_post
  	@project = Project.new(project_params)
  	if @project.save
  	redirect_to admin_update_current_work_home_path
  else 
  	redirect_to root_path
  	end
  end

  def admin_update_slide_show

  end

  def admin_update_slide_show_post

  end

  def admin_update_current_work_home

  end

  def admin_create_room_post
    @room = Room.new(room_params)
    @room.project_id = params[:project_id]
    # @room.path = 
    respond_to do |format|
      format.html{
        if @room.save
          redirect_to project_path(@room.project)
        else 
          
        end
      }
      format.js
    end
  end

  def admin_create_slide_show
    @slideshow = Slideshow.new
  end

  def admin_create_past_work
    @masonry = Masonry.new
  end

  def admin_create_slide_show_post
    @slideshow = Slideshow.new(slide_show_params)
      if @slideshow.save
    redirect_to admin_update_slide_show_path
      else 
    redirect_to root_path
    end
  end

  def admin_create_past_work_post
    @masonry = Masonry.new(masonry_params)
      if @masonry.save
    redirect_to admin_update_past_work_path
      else 
    redirect_to root_path
    end
  end

  def admin_delete_slide_show_path
    @user.destroy
    redirect_to admin_update_slide_show_path
  end

  private

  def masonry_params
    params.require(:masonry).permit(:size, :avatar)
  end

  def contact_params
    params.require(:contact).permit(:email, :phone_number, :street_address, :address)
  end

  def room_params
    params.require(:room).permit(:name, :path, :project_id, :path)
  end

  def project_params
  	params.require(:project).permit(:name, :avatar)
  end

  def slide_show_params
    params.require(:slideshow).permit(:avatar)
  end
  
end