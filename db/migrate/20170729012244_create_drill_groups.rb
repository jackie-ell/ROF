class CreateDrillGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :drill_groups do |t|
      t.references :user, foreign_key: true, index: true
      t.string :category
      t.text :description
      t.string :difficulty

      t.timestamps
    end
  end
end
