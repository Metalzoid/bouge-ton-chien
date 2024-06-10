class AddMoneyToCourses < ActiveRecord::Migration[7.1]
  def change
    add_column :courses, :money, :integer
  end
end
