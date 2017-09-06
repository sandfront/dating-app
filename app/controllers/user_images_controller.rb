class UserImagesController < ApplicationController
  def edit
    @user = User.find(params[:profile_id])
    @photo = @user.user_images.find(params[:id])
    authorize @user, :edit_image?
    authorize @photo
  end

  def update
    @user = User.find(params[:profile_id])
    @photo = UserImage.find(params[:id])
    authorize @photo
    authorize @user
    if @photo.update(photo_params)
      redirect_to edit_profile_path(@user)
    else
      render :edit, alert: "Something went wrong"
    end
  end

  def show
    @user = User.find(params[:profile_id])
    @photo = @user.user_images.find(params[:id])
    authorize @photo
  end

  def destroy
    @photo = UserImage.find(params[:id])
    authorize @photo
    if @photo.delete
      redirect_to edit_profile_path(current_user)
    else
      render :show
    end
  end

  private

  def photo_params
    params.require(:fb_image).permit(:fb_photo_id)
  end

end
