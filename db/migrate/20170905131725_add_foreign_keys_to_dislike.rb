class AddForeignKeysToDislike < ActiveRecord::Migration[5.1]
  def change
    add_column :dislikes, :first_user_id, :integer, index: true
    add_foreign_key :dislikes, :users, column: :first_user_id
    add_column :dislikes, :second_user_id, :integer, index: true
    add_foreign_key :dislikes, :users, column: :second_user_id
  end
end
