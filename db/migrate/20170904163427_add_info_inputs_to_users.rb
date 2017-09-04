class AddInfoInputsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :college, :string
    add_column :users, :what_im_into, :text
    add_column :users, :looking_for, :text
  end
end
