class ApplicationController < ActionController::Base

    before_action :fetch_user
    
 def fetch_user
        if session[:user_id].present?
          @current_user = User.find_by id: session[:user_id]
          
          
        end #login check
        
        #if e.g you have re-seeded since logging in, session[:user_id] will be defined and contain an ID, but it will be an invalide ID, i.e. the find_by above will have returned nil
        unless @current_user.present?
          session[:user_id] = nil # force logout of invalid ID
        end
    end

    def check_if_logged_in
        #if the current request (which could be any action of any controller)
        # is coming from a user who is not logged in, redirect them to the login page
        #any congtroller action that should be available only to logged-in
        #user can specify this method as a before_action at the top of the controller class to protect access to those actions
        # i.e. we can lock down specific routes
        
        
        unless @current_user.present?
            flash[:error] = "You must be logged in to perform that action"
            redirect_to login_path
        end
        
    end

end
