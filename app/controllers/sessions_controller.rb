class SessionsController < ApplicationController
  def new
  end

  def create
    
    
    user = User.find_by email: params[:email]

    
    if user.present? && user.authenticate(params[:password])
    
      

      session[:user_id] = user.id 
      redirect_to root_path 
    else

      
      flash[:error] = 'Invalid email address or password'

      redirect_to login_path # try again! todo: show error message

    end

  end

  def destroy
    session[:user_id] = nil #logs out the user
    redirect_to login_path # back to the login page
  end
end
