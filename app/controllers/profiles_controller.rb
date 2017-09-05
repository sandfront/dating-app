require 'open-uri'
require 'json'

class ProfilesController < ApplicationController
  def index
    @users = policy_scope(User).includes(:user_images).sample(12)
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update(user_params)
      puts "I updated the model"
      p @user
      respond_to do |format|
        format.html { redirect_to edit_profile_path(@user) }
        format.js
      end
    else
      puts "you fucked up"
    end
  end

  def onboard
    @user = User.find(params[:user_id])
    authorize @user
  end

  private

  def user_params
    params.require(:user).permit(:gender, :first_name, :last_name, :course, :college, :what_im_into, :looking_for, {:gender_preferences => []}, user_images: [:id, :user_id, :photo])
  end

  # def get_urls_from_user_images
  #   photos_array = [] # INIT of array of each JSON of size options
  #   current_user.user_images.each do |image|
  #     url_three = "https://graph.facebook.com/#{photo["id"]}?fields=images&access_token=#{current_user.token}"
  #     photos_array << JSON.parse(open(url_three).read)["images"].first
  #   end

  #   photos_url = [] # array of large image source urls for one user's profile pictures
  #   photos_array.flatten.each do |photo|
  #     photos_url << photo["source"]
  #   end
  #   return photos_url
  # end
end
