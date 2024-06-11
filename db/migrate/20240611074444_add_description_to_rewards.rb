class AddDescriptionToRewards < ActiveRecord::Migration[7.1]
  def change
    add_column :rewards, :description, :text
  end
end
