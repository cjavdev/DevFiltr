class SessionsController < ApplicationController
  def create
    @user = User.find_by_username(params[:username])
    if @user.validate_password(params[:password])
      session[:token] = @user.reset_token
      redirect_to user_url(@user)
    else
      render :new
    end
  end
  
  def new 
  end
  
  def destroy
    current_user.reset_token if current_user
    session[:token] = nil
  end
end
