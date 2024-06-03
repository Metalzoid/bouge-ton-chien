class AddDefaultToUserRole < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :role, 0
  end
end
