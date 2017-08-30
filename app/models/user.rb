require 'date'
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]
  has_many :answers
  has_many :facebook_likes, dependent: :destroy
  has_many :choices, through: :answers
  has_many :user_images, dependent: :destroy
  accepts_nested_attributes_for :user_images

  def likes # return only when YOUVE BEEN THE FIRST to like
    Match.where(first_user: self)
  end

  def been_liked # second_user denotes the person who HAS BEEN LIKED by the PERSON WHO LIKED FIRST
    Match.where(second_user: self)
  end

  def matches
    Match.where(first_user: self).or(Match.where(second_user: self)).where(mutual: true)
  end

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image

    user_params[:gender] = auth.extra.raw_info.gender
    user_params[:friends] = auth.extra.raw_info.friends
    user_params[:birthday] = Date.strptime(auth.extra.raw_info.birthday, '%m/%d/%Y')
    # user_params[:school] = auth.extra.raw_info.education.last.school.name
    # user_params[:subject] = auth.extra.raw_info.education.last.concentration.first.name
    # user_params[:work] = "needs coding"

    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
      user.persist_fblikes(auth)
      user.persist_user_fb_photos
    end
    return user
  end

  def persist_fblikes(auth)
    likes_hashie = auth.extra.raw_info.likes.data
    likes_hashie.each do |like|
      fb_like = FacebookLike.new(like_id: like.id, name: like.name)
      fb_like.user = self
      fb_like.save
    end
  end

  def persist_user_fb_photos
    url_one = "https://graph.facebook.com/#{self.uid}/albums?access_token=#{self.token}"
    albums_hashes = JSON.parse(open(url_one).read)["data"]

    profile_pictures = [] # list of photos within the profile pictures album
    albums_hashes.each do |album|
      if album["name"] == "Profile Pictures"
        url_two = "https://graph.facebook.com/#{album["id"]}/photos?access_token=#{self.token}"
        profile_pictures << JSON.parse(open(url_two).read)["data"] # puts the photos of each album into photos array
      end
    end

    profile_pictures.flatten.each do |photo|
      fb_photo = UserImage.new(photo: photo["id"]) # unique id from facebook for the photo
      fb_photo.user = self
      fb_photo.save
    end
  end
end
