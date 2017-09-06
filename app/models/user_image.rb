class UserImage < ApplicationRecord
  belongs_to :user

  def url
    facebook_images.first["source"]
    # return JSON.parse(open(base_url).read)["images"].first["source"] # first picks largest size availble
  end

  # def medium_url
  #   base_url = "https://graph.facebook.com/#{self.photo}?fields=images&access_token=#{self.user.token}" # passed in the id and foreign key
  #   third_image = JSON.parse(open(base_url).read)["images"].third # third picks medium size if availble
  #   if third_image
  #     return third_image["source"]
  #   else
  #     # if we can't find a medium size image we return the full size
  #     self.url
  #   end
  # end

  def small_url
    facebook_images.last["source"]
  end

  def medium_url
    images = facebook_images
    if images.third.nil?
      images.first["source"]
    else
      images.third["source"]
    end
  end

  private

  def facebook_images
    Cache.instance.get(:facebook_images, user.id, photo) do
      base_url = "https://graph.facebook.com/#{photo}?fields=images&access_token=#{user.token}" # passed in the id and foreign key
      JSON.parse(open(base_url).read)["images"]
    end
  end
end
