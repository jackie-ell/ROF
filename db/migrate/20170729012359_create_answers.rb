class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.references :user, foreign_key: true, index: true    #this is only for users that are admin
      t.references :question, foreign_key: true, index: true

      t.text :body

      t.timestamps
    end
  end
end
