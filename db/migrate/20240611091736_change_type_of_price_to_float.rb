class ChangeTypeOfPriceToFloat < ActiveRecord::Migration[7.1]
  def change
    change_column(:rewards, :price, :float)
  end
end
