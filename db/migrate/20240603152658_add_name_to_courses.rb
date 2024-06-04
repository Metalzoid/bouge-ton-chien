class AddNameToCourses < ActiveRecord::Migration[7.1]
  def change
    add_column :courses, :name, :string
  end
end
