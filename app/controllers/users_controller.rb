class UsersController < ApplicationController
  def toggle_stalk
    target_user = User.find(params[:user_id])
    if current_user.following?(target_user)
      current_user.stop_following(target_user)
      notice = "You are not stalking #{target_user.name}"
    else
      current_user.follow(target_user)
      notice = "You are stalking #{target_user.name}"
    end
    redirect_to :back, notice: notice
  end
end
