class Question < ApplicationRecord
  belongs_to :drill_group
  belongs_to :user

  has_many :answers, dependent: :destroy
  has_many :users_questions
end
