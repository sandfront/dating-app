class RemoveDescriptionsFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :description
    remove_column :users, :desc_test1
    remove_column :users, :desc_test2
    remove_column :users, :desc_test3
  end
end
