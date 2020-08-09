class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to the Message-me, #{@user.username}, you have successfully signed up."
      redirect_to root_path
    else
      flash[:error] = "There was a problem with your signup information."
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end