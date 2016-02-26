class UsersController < ApplicationController
  before_filter :authorize_user, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.persisted?
      flash[:success] = "Welcome, #{@user.username}!"
      session[:user_id] = @user.id
      redirect_to user_path(current_user.id)
    else
      flash[:danger] = @user.errors.full_messages.to_sentence
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    @users = User.search(params[:searched_user])

    @tweet = Tweet.new
    @favorites = @user.favorites

    if my_page?
      @tweet_feed = @user.tweet_feed
    else
      @tweet_feed = @user.tweets
    end
  end

  def my_page?
    current_user.id == params[:id].to_i
  end
  helper_method :my_page?

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
