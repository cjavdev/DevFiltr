class SessionsController < ApplicationController
  def create
    @user = User.find_by_username(params[:username])
    if @user.validate_password(params[:password])
      session[:token] = @user.reset_token
      render :json => @user
    else
      render :json => @user.errors.full_messages, :status => 422
    end
  end
  
  def new 
  end
  
  def destroy
    current_user.reset_token if current_user
    session[:token] = nil
  end
end
