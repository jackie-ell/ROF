class Question < ApplicationRecord
  belongs_to :drill_group, optional: true
  belongs_to :user, optional: true

  has_many :answers, dependent: :destroy
  has_many :users_questions
end
