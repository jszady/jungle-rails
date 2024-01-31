class SessionsController < ApplicationController

  def new
  end

  #we need to auth the user 
    #then we need to save it in the session
  def create
    user = User.authenticate_with_credentials(params[:email], params[:password])

    if user
      session[:user_id] = user.id
      redirect_to root_path
    else 
      flash.now[:alert] = 'Incorrect Email or Password !'
      render :new
    end

  end

  # Remove the user ID from the session
   def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: 'Logged out successfully.'
  end

end