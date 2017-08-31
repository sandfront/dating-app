class UserImage < ApplicationRecord
  belongs_to :user


  def url
    base_url = "https://graph.facebook.com/#{self.photo}?fields=images&access_token=#{self.user.token}" # passed in the id and foreign key
    return JSON.parse(open(base_url).read)["images"].first["source"] # first picks largest size availble
  end

  def small_url
    base_url = "https://graph.facebook.com/#{self.photo}?fields=images&access_token=#{self.user.token}" # passed in the id and foreign key
    return JSON.parse(open(base_url).read)["images"].last["source"] # last picks small size
  end

end
