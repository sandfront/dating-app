class AddCourseToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :course, :string
  end
end
