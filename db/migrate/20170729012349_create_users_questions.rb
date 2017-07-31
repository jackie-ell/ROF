class CreateUsersQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :users_questions do |t|
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true



      t.boolean :is_correct
      t.text :last_answer
      t.integer :num_attempts

      t.timestamps
    end
    add_index :users_questions, [:user_id, :question_id], unique: true
  end
end
