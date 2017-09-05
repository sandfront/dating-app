require 'open-uri'
require 'json'

class ProfilesController < ApplicationController
  skip_after_action :verify_policy_scoped, only: :index

  def index
    query = <<-SQL
      SELECT * FROM users u
      WHERE id NOT IN
      (
        SELECT second_user_id FROM matches WHERE first_user_id = :current_user_id
        UNION
        SELECT first_user_id FROM matches WHERE second_user_id = :current_user_id AND mutual = TRUE
        UNION
        SELECT id FROM users WHERE gender NOT IN (:gender_preferences)
      )
      AND u.id != :current_user_id
    SQL

    @users = User.find_by_sql([ query, { current_user_id: current_user.id, gender_preferences: current_user.gender_preferences }])
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
