class AddDefaultToUserMoney < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :money, 0
  end
end
