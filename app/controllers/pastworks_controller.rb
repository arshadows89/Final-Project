class PastworksController < ApplicationController
	before_action :set_pastwork, only: [:edit, :update, :show, :destroy]

  def index
  	@pastwork = current_pastwork
  	@pastwork = Masonry.all 
  end

  def show
  end

  def edit
  	@pastwork = current_pastwork
  end

  def new
  	@pastwork = Masonry.new
  end

  def create
  	@pastwork = Masonry.new(pastwork_params)
      if @pastwork.save
    redirect_to admin_update_past_work_path
      else 
    redirect_to root_path
    end
  end

  def update
  		if @pastwork.update(pastwork_params)
  		redirect_to root_path
  	end
  end

  def destroy
  	@pastwork.destroy
  	redirect_to admin_update_past_work_path
  end

  private

  def set_pastwork
  	@pastwork = Masonry.find(params[:id])
  end

  def slideshow_params
  	params.require(:masonry).permit(:avatar, :size)
  end

  def current_pastwork
    session[:masonry_id] ? Masonry.find(session[:pastwork_id]) :nil
  end

end
