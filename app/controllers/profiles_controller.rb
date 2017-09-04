require 'open-uri'
require 'json'

class ProfilesController < ApplicationController
  def index
    # users = []

    # # does the user have expressed preferences?
    # if current_user.gender_preferences
    #   if current_user.gender_preferences.include?("male")
    #     users << User.where(gender: "male")
    #   end
    #   if current_user.gender_preferences.include?("female")
    #     users << User.where(gender: "female")
    #   end
    #   if current_user.gender_preferences.include?("non-binary")
    #     users << User.where(gender: "non_binary")
    #   end
    # else
    #   # if no expressed preferences, give all
    #   @users = User.all

    @users = policy_scope(User).sample(12)
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
    params.require(:user).permit(:first_name, :last_name, :course, :college, :what_im_into, :looking_for, user_images: [:id, :user_id, :photo])
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
