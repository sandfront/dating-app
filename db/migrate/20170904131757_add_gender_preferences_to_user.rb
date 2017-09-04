class AddGenderPreferencesToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :gender_preferences, :string
  end
end
