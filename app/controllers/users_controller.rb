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
    @tweets = get_tweets_for_following_users

    @favorited_tweets = get_favorited_tweets
  end

  def get_tweets_for_following_users
    if current_user.id == params[:id].to_i
      tweets = Tweet.where(user_id: current_user.id)
      current_user.following.each { |u| tweets << u.tweets }
      current_user.favorites{ |f| tweets << f.tweet }
      tweets.flatten
    else
      tweets = Tweet.where(user_id: params[:id])
    end
  end


  def get_favorited_tweets
    if current_user.id == params[:id].to_i
      tweets = []
      current_user.favorites{ |f| tweets << f.tweet }
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
