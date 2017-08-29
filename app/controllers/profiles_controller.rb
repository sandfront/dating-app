require 'open-uri'
require 'json'

class ProfilesController < ApplicationController
  def index
    @profiles = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @photos_urls = find_user_fb_photos
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      params[:user_images]['photo'].each do |p|
        @user.user_images.update(photo: p)
      end
      redirect_to profile_path(@user)
    else

    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :course, user_images: [:id, :user_id, :photo])
  end

  def find_user_fb_photos
    url_one = "https://graph.facebook.com/#{current_user.uid}/albums?access_token=#{current_user.token}"
    albums_hashes = JSON.parse(open(url_one).read)["data"]
    photos = []
    albums_hashes.each do |album|
      url_two = "https://graph.facebook.com/#{album["id"]}/photos?access_token=#{current_user.token}"
      photos << JSON.parse(open(url_two).read)["data"] # puts the photos of each album into photos array
    end
    photos_array = []
    photos.flatten.first(10).each do |photo|
      url_three = "https://graph.facebook.com/#{photo["id"]}?fields=images&access_token=#{current_user.token}"
      photos_array << JSON.parse(open(url_three).read)["images"].first
    end
    photos_url = []
    photos_array.flatten.each do |photo|
      photos_url << photo["source"]
    end
    return photos_url
  end
end
