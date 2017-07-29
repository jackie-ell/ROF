class CreateDrillGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :drill_groups do |t|
      t.string :category
      t.text :description
      t.string :difficulty

      t.timestamps
    end
  end
end
