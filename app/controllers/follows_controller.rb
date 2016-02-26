class FollowsController < ApplicationController
  def create
    if follow.update_attributes(follower: current_user, followed: followed_user)
      flash[:success] = "#{follow.followed.username} has been followed!"
    else
      flash[:danger] = follow.errors.full_messages.to_sentence
    end
    redirect_to user_path(current_user.id)
  end

  def destroy
    if follow.destroy
      flash[:success] = "#{unfollowed_user.username} has been unfollowed!"
    else
      flash[:danger] = follow.errors.messages
    end
    redirect_to user_path(current_user.id)
  end

  private

  def follow
    @favorite ||= params[:id] ? Follow.find(params[:id]) : Follow.new
  end

  def followed_user
    User.find(params[:user_id])
  end

  def unfollowed_user
    User.find(follow.followed_id)
  end
end
