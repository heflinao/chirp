class TweetsController < ApplicationController
  def index
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet[:user_id] = current_user.id
    if @tweet.save
      redirect_to root_path
      flash[:success] = "Tweet saved!"
    else
      render "index"
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
