class ChangeDefaultOfMutual < ActiveRecord::Migration[5.1]
  def change
    change_column_default :matches, :mutual, nil
  end
end
