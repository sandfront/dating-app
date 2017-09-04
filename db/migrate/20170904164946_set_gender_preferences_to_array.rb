class SetGenderPreferencesToArray < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :gender_preferences
    add_column :users, :gender_preferences, :string, array: true, default: []
  end
end
