class ActivitiesController < ApplicationController
  
  before_action :check_if_logged_in, except: [ :index, :show ]
  
  def new

    @activity = Activity.new 
  end

  def create

    @activity = Activity.new activity_params
    @activity.user_id = @current_user.id
    if params[:activity][:image].present?
      response = Cloudinary::Uploader.upload params[:activity][:image]
      # p response
      @activity.image = response["public_id"]
    end
    @activity.save

    if @activity.persisted?
      redirect_to activity_path(@activity)
    else
      render :new
    end #else
  end

  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find params[:id]
    @comment = Comment.new
    @booking = Booking.new
  end

  def edit
    @activity = Activity.find params[:id]
    
    
    if @activity.user_id != @current_user.id
      redirect_to login_path # don't even show the edit form  
    end

  end

  def update
    @activity = Activity.find params[:id]
    if params[:activity][:image].present?
      response = Cloudinary::Uploader.upload params[:activity][:image]
      # p response
      @activity.image = response["public_id"]
    end
    @activity.save

    
    if @activity.user_id != @current_user.id
      redirect_to login_path
      return
      
    end

    @activity.categories.delete_all

    if params[:category_ids].present?
      @activity.categories << Category.find(params[:category_ids])
    end
    
    if @activity.update activity_params
      redirect_to activity_path(@activity)
    else
      render :edit
    end
  end

  def destroy
    @activity = Activity.find params[:id]

    if @activity.user_id != @current_user.id
      redirect_to login_path
      return
    end

    @activity.destroy
    redirect_to activities_path
  end

  private
  def activity_params
    params.require(:activity).permit(:title, :in_location, :takeplace_time, :description, :user_id)
  end
end
