class UsersController < ApplicationController
  before_filter :require_login, :except => [ :new, :create ]

  def index
    @users = User.all
    render :json => @users
  end

  def show
    @user = User.find(params[:id])
    render :json => @user
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      render :json => @user
    else
      render :json => @user.errors.full_messages, :status => 422
    end
  end
end
