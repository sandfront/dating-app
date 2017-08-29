class RenameColumnInUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :education, :school
  end
end
