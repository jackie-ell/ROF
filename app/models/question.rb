class Question < ApplicationRecord
  belongs_to :drill_group
  belongs_to :user

  has_many :answers
  has_many :users_questions
end
