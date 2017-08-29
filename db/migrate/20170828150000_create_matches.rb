class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.boolean :mutual, default: false
    end
  end
end
