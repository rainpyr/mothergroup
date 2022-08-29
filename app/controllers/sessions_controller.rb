class SessionsController < ApplicationController
  def new
  end

  def create
    
    #1. check that the email address entered is actually in the DB

    user = User.find_by email: params[:email]

    #2. did we actually find a user with that email address (or was it a nil), and if we did find a user, is the password entered the correct password fot this email address
    #note that .authenticate will encrypt the password entered via the form on-the-fly, and compare it to the user.password_digest
    if user.present? && user.authenticate(params[:password])
    
      #credentials are correct - successful login!

      # 'session' is a special Rails hash which remebers its contects across pages reloads - recall that most variables in our controllers are not shared across reload int his way
      #the way Rails causes this session hash to be remember is by storing it in an HTTP cookie - i.e. aks the browser to remember something via a response header for this page load
      # for every subsequent request from the browser, it will re-present that cookie to the server as a request header

      session[:user_id] = user.id #ALSO do this when creating a new user
      redirect_to root_path # back to /
    
    else

      # eithr user was nil or the password given did not, when encrypted, match the password digest stored for that user account

      #the special variable 'flash' is a bit like 'session' variable in that it uses HTTP cookies to persist some data across page loads, but in this case, the data only persists for one more page load, so you can show an error on the login page after we direct there, but the error doesn't stick arpund forever. if you reload the page again, the flash will be cleared and the error message will not appear again
      flash[:error] = 'Invalid email address or password'

      redirect_to login_path # try again! todo: show error message

    end

  end

  def destroy
    session[:user_id] = nil #logs out the user
    redirect_to login_path # back to the login page
  end
end
