class AddDescriptionsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :desc_test1, :text
    add_column :users, :desc_test2, :text
    add_column :users, :desc_test3, :text
  end
end
