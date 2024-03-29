class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Account has been sucessfully created"
      redirect_to root_path
    else
      flash.now[:error] = "Error creating account"
      render :new
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end