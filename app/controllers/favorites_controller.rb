class FavoritesController < ApplicationController
  def create
    if favorite.update_attributes(tweet: tweet, user: current_user)
      flash[:success] = "Tweet has been favorited!"
    else
      flash[:danger] = favorite.errors.full_messages.to_sentence
    end
    redirect_to user_path(current_user.id)
  end

  def destroy
    if favorite.destroy
      flash[:success] = "Tweet has been unfavorited!"
    else
      flash[:danger] = favorite.errors.messages
    end
    redirect_to user_path(current_user.id)
  end

  private

  def favorite
    @favorite ||= params[:id] ? Favorite.find(params[:id]) : Favorite.new
  end

  def tweet
    @tweet ||= Tweet.find(params[:tweet_id])
  end
end
