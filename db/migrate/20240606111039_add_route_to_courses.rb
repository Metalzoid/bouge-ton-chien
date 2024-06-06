class AddRouteToCourses < ActiveRecord::Migration[7.1]
  def change
    add_column :courses, :route, :json
  end
end
