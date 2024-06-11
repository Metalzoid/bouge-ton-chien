class ChangePriceOnReductionToRewards < ActiveRecord::Migration[7.1]
  def change
    rename_column :rewards, :price, :reduction
  end
end
