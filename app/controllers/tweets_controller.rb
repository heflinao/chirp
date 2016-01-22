class TweetsController < ApplicationController
  before_filter :authorize_user
  
  def create
    tweet = Tweet.new(tweet_params)
    tweet[:user_id] = current_user.id
    if tweet.save
      redirect_to user_path(current_user.id)
      flash[:success] = "Tweet saved!"
    else
      flash[:danger] = tweet.errors.full_messages.to_sentence
      redirect_to user_path(current_user.id)
    end
  end

  def destroy
    Tweet.find(params[:id]).destroy
    flash[:success] = "Tweet has been deleted!"
    redirect_to user_path(current_user.id)
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
