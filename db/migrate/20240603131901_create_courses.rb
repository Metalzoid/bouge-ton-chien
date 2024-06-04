class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.float :distance
      t.float :latitude
      t.float :longitude
      t.boolean :water
      t.boolean :trashs
      t.boolean :poopbag
      t.boolean :familyfriendly
      t.integer :difficulty
      t.integer :timing
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
