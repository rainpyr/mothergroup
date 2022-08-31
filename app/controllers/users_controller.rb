class UsersController < ApplicationController
  
  
  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    if @user.persisted?
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
    
    if @user.id != @current_user.id
      redirect_to login_path # don't even show the edit form  
    end

  end

  def update
    @user = User.find params[:id]

    if @user.id != @current_user.id
      redirect_to login_path
      return
      
    end
    
    if @user.update user_params
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy

    if @user.id != @current_user.id
      redirect_to login_path
      return
    end

    User.destroy params[:id]

    redirect_to root_path
  end

  private
  def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
