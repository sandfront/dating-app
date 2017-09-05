class ChangeDefaultMutual < ActiveRecord::Migration[5.1]
  def change
    change_column :matches, :mutual, :boolean, default: false
  end
end
