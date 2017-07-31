class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.references :user, foreign_key: true, index: true
      t.string :name
      t.string :threshhold
      t.integer :t_value

      t.timestamps
    end
  end
end
