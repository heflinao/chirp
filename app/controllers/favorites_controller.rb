class FavoritesController < ApplicationController
  def favorite
    tweet = Tweet.find(params[:tweet_id])
    favorite = Favorite.new(user: current_user, tweet: tweet)

    if favorite.save
      flash[:success] = "Tweet has been favorited!"
    else
      flash[:danger] = favorite.errors.full_messages.to_sentence
    end
    redirect_to user_path(current_user.id)
  end

  def unfavorite
    fav = Favorite.find(params[:favorite_id])
    fav.destroy

    if fav.destroyed?
      flash[:success] = "Tweet has been unfavorited!"
    else
      flash[:danger] = favorite.errors.messages
    end
    redirect_to user_path(current_user.id)
  end
end
