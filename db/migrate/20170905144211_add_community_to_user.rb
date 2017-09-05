class AddCommunityToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :community, foreign_key: true
  end
end
