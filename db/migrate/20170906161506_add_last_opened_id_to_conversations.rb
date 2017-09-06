class AddLastOpenedIdToConversations < ActiveRecord::Migration[5.1]
  def change
    add_column :conversations, :last_opened_id, :integer
  end
end
