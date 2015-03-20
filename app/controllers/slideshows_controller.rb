class SlideshowsController < ApplicationController
	before_action :set_slideshow, only: [:edit, :update, :show, :destroy]

  def index
  	@slideshow = current_slideshow
  	@slideshow = Slideshow.all 
  end

  def show
  end

  def edit
  	@slideshow = current_slideshow
  end

  def new
  	@slideshow = Slideshow.new
  end

  def create
  	@slideshow = Slideshow.new(slide_params)
      if @slideshow.save
    redirect_to admin_update_current_work_path
      else 
    redirect_to root_path
    end
  end

  def update
  		if @slideshow.update(slideshow_params)
  		redirect_to root_path
  	end
  end

  def destroy
  	@slideshow.destroy
  	redirect_to admin_update_slide_show_path
  end

  private

  def set_slideshow
  	@slideshow = Slideshow.find(params[:id])
  end

  def slideshow_params
  	params.require(:slideshow).permit(:avatar)
  end

  def current_slideshow
    session[:slideshow_id] ? Slideshow.find(session[:slideshow_id]) :nil
  end

end
