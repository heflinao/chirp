class FavoritesController < ApplicationController
  def favorite
    tweet = Tweet.find(params[:id])
    favorite = Favorite.new(user: current_user, tweet: tweet)

    if favorite.save
      flash[:success] = "Tweet has been favorited!"
    else
      flash[:danger] = favorite.errors.messages
    end
    redirect_to user_path(current_user.id)
  end

  def unfavorite
    f = Favorite.find(params[:id])
    tweet = f.tweet
    Favorite.where(tweet: tweet, user: current_user).destroy_all
    flash[:success] = "Tweet has been unfavorited!"
    redirect_to user_path(current_user.id)
  end
end
