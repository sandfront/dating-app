require 'open-uri'
require 'json'

class ProfilesController < ApplicationController
  def index
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    # if @user.update(user_params)
    #   params[:user_images]['photo'].each do |p|
    #     @user.user_images.update(photo: p)
    #   end
    #   redirect_to profile_path(@user)
    # else

    # end
    @user.update(user_params)
    if @user.save
      redirect_to edit_profile_path(@user)
    else
      puts "you fucked up"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :desc_test1, :desc_test2, :description, :desc_test3, user_images: [:id, :user_id, :photo])
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
