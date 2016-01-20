class UsersController < ApplicationController
  before_filter :authorize_user, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome, #{@user.username}!"
      session[:user_id] = @user.id
      redirect_to user_path(current_user.id)
    else
      flash[:danger] = "User could not be created."
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    @users = User.where("id != ?", current_user.id)

    @tweet = Tweet.new
    @favorites = @user.favorites

    if current_user.id == params[:id].to_i
      @tweet_feed = @user.tweet_feed
    else
      @tweet_feed = @user.tweets
    end
  end



  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
