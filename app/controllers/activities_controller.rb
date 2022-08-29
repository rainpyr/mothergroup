class ActivitiesController < ApplicationController
  
  before_action :check_if_logged_in, except: [ :index, :show ]
  
  def new

    @activity = Activity.new 
  end

  def create

    @activity = Activity.new activity_params
    @activity.user_id = @current_user.id
    @activity.save

    if @activity.persisted?
      redirect_to activities_path
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
  end

  def edit
    @activity = Activity.find params[:id]
    
    if @activity.user_id != @current_user.id
      redirect_to login_path # don't even show the edit form  
    end

  end

  def update
    @activity = Activity.find params[:id]

    # check again that this mixtape belongs to the logged-in user, since people can still work out the edit URL
    if @activity.user_id != @current_user.id
      redirect_to login_path
      return
      #stop the rest of the code from running
      #i.e prevent .ipdate that follows
      # note: a redirect_to does not on its own prevernt the rest of the controller action's code from running
    end
    
    if @activity.update activity_params
      redirect_to activity_path(@activity)
    else
      render :edit
    end
  end

  def destroy

    if @activity.user_id != @current_user.id
      redirect_to login_path
      return
    end

    Activity.destroy params[:id]

    redirect_to movies_path
  end

  private
  def activity_params
    params.require(:activity).permit(:title, :inlocation, :takeplace_time, :description, :user_id)
  end
end
