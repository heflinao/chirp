class SessionsController < ApplicationController
  def new
  end

  def authenticate
    user = User.find_by(username: params[:username])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
      flash[:success] = "Welcome, #{user.username}!"
    else
      flash[:danger] = "Incorrect username or password."
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
