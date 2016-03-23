class UsersController < ApplicationController
  def stalk
    user_to_follow = User.find(params[:user_id])
    current_user.follow(user_to_follow)
    redirect_to :back, notice: "You are stalking #{user_to_follow.name}"
  end

  def unstalk
    user_to_unfollow = User.find(params[:user_id])
    current_user.stop_following(user_to_unfollow)
    redirect_to :back, notice: "You are not stalking #{user_to_unfollow.name}"
  end
end
