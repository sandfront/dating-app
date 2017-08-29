class ProfilesController < ApplicationController
  def index

  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user  = User.find(params[:id])
    if @user.update(user_params)
      params[:user_images]['photo'].each do |p|
        @user.user_images.create!(:photo => p)
      end
      redirect_to profile_path(@user)
    else
      render "edit_profile(@user)"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :course, user_images: [:id, :user_id, :photo])
  end
end
