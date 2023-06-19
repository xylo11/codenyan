class UserProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_profile

  def edit
  end

  def update
    if @user_profile.update(user_profile_params)
      redirect_to user_path(current_user), notice: 'Your profile has been updated.'
    else
      render :edit
    end
  end

  private

  def set_user_profile
    @user_profile = current_user.user_profile
  end

  def user_profile_params
    params.require(:user_profile).permit(:nickname, :intro, :avatar)
  end
end