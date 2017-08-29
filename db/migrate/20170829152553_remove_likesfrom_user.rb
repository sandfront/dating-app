class RemoveLikesfromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :likes
  end
end
