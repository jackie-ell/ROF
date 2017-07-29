class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.string :badge_name
      t.string :threshhold
      t.integer :value


      t.timestamps
    end
  end
end
