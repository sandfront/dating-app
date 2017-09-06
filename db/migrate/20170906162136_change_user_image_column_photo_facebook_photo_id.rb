class ChangeUserImageColumnPhotoFacebookPhotoId < ActiveRecord::Migration[5.1]
  def change
    rename_column :user_images, :photo, :fb_photo_id
  end
end
