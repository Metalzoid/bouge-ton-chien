class AddMoneyToRewards < ActiveRecord::Migration[7.1]
  def change
    add_column :rewards, :money, :integer
  end
end
