class ChangeLikeIdToBigInt < ActiveRecord::Migration[5.1]
  def change
    change_column :facebook_likes, :like_id, :bigint
  end
end
