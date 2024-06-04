class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :comment
      t.references :user, null: true, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
