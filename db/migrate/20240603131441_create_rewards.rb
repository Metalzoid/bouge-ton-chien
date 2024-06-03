class CreateRewards < ActiveRecord::Migration[7.1]
  def change
    create_table :rewards do |t|
      t.integer :price
      t.string :name
      t.string :promocode
      t.string :link

      t.timestamps
    end
  end
end
