class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.references :user, foreign_key: true, index: true
      t.references :drill_group, foreign_key: true, index: true

      t.text :description
      t.integer :points

      t.timestamps
    end
  end
end
