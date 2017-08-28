class AddUserRefToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :first_user_id, :integer, index: true
    add_foreign_key :matches, :users, column: :first_user_id
    add_column :matches, :second_user_id, :integer, index: true
    add_foreign_key :matches, :users, column: :second_user_id
  end
end
