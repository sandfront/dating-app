class CreateFacebookLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :facebook_likes do |t|
      t.integer :like_id
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
