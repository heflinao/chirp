class TweetsController < ApplicationController
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet[:user_id] = current_user.id
    if @tweet.save
      redirect_to user_path(current_user.id)
      flash[:success] = "Tweet saved!"
    else
      render template: "users/show"
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
