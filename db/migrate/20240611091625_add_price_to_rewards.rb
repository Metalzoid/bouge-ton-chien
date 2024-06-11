class AddPriceToRewards < ActiveRecord::Migration[7.1]
  def change
    add_column :rewards, :price, :integer
  end
end
