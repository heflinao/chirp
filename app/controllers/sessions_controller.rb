class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to user_path(current_user.id)
    end
  end

  def authenticate
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
      flash[:success] = "Welcome, #{user.username}!"
    else
      flash[:danger] = "Incorrect username or password."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

  private

  def user
    User.find_by(username: params[:username])
  end
end
