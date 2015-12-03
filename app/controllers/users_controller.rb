class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome, #{@user.username}!"
    else
      flash[:danger] = "Welcome, #{@user.username}!"
      render "new"
    end
  end

  private

  def user_params
    params.permit(:user).require(:username, :password, :password_confirmation)
  end
end
