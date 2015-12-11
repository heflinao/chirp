class FollowsController < ApplicationController
  def follow
    followed_user = User.find(params[:id])
    follow = Follow.new(follower: current_user, followed: followed_user)

    if follow.save
      flash[:success] = "#{follow.followed.username} has been followed!"
    else
      flash[:danger] = follow.errors.messages
    end
    redirect_to user_path(current_user.id)
  end

  def unfollow
    Follow.where(followed: params[:id]).destroy_all
    unfollowed_user = User.find(params[:id])
    flash[:success] = "#{unfollowed_user.username} has been unfollowed!"
    redirect_to user_path(current_user.id)
  end
end
