class CreateCommunities < ActiveRecord::Migration[5.1]
  def change
    create_table :communities do |t|
      t.string :title
      t.string :brand_color
      t.string :logo

      t.timestamps
    end
  end
end
