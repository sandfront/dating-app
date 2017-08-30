class UserImage < ApplicationRecord
  belongs_to :user


  def url
    url_three = "https://graph.facebook.com/#{self.photo}?fields=images&access_token=#{self.user.token}" # passed in the id and foreign key
    return JSON.parse(open(url_three).read)["images"].first["source"] # first picks largest size availble
  end

end
