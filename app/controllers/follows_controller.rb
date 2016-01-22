class FollowsController < ApplicationController
  def follow
    followed_user = User.find(params[:user_id])
    follow = Follow.new(follower: current_user, followed: followed_user)

    if follow.save
      flash[:success] = "#{follow.followed.username} has been followed!"
    else
      flash[:danger] = follow.errors.full_messages.to_sentence
    end
    redirect_to user_path(current_user.id)
  end

  def unfollow
    follow = Follow.find(params[:follow_id])
    unfollowed_user = User.find(follow.followed_id)
    follow.destroy
    if follow.destroyed?
      flash[:success] = "#{unfollowed_user.username} has been unfollowed!"
    else
      flash[:danger] = follow.errors.messages
    end
    redirect_to user_path(current_user.id)
  end
end
