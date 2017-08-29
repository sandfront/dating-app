class AddFacebookFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :gender, :string
    add_column :users, :friends, :string
    add_column :users, :birthday, :string
    add_column :users, :education, :string
    add_column :users, :events, :string
    add_column :users, :likes, :string
    add_column :users, :photos, :string
    add_column :users, :work, :string
  end
end
