class UserImagesController < ApplicationController

  def show
    @user = current_user
    @photo = UserImage.find(params[:id])
  end

  def update

  end

  def destroy
  end

end
