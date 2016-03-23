class UsersController < ApplicationController
  def stalk
    user_to_follow = User.find(params[:user_id])
    current_user.follow(user_to_follow)
    redirect_to :back, notice: "You are stalking #{user_to_follow.name}"
  end
end
