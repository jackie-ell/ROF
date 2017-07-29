class CreateDrills < ActiveRecord::Migration[5.1]
  def change
    create_table :drills do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.references :drill_group, foreign_key: true
      t.integer :points

      t.timestamps
    end
  end
end
