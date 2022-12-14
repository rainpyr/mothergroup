class CommentsController < ApplicationController
  
  before_action :check_if_logged_in
  
  def new
    @comment = Comment.new 
    
  end

  def create
    @comment = Comment.new comment_params
    @comment.user_id = @current_user.id
    @comment.save
    

    if @comment.persisted?

      redirect_back(fallback_location: root_path)
      # redirect_to activity_path(params[:comment][:activity_id])
    else
      render :new
    end #else


  end

  def index
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:activity_id, :body, :comment_id, :product_id)
  end

end
