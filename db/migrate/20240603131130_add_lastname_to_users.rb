class AddLastnameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :lastname, :string
  end
end
