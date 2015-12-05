class SessionsController < ApplicationController
  def create
    user = User.find(username: params[:username])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
