class AddMoneyToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :money, :integer
  end
end
