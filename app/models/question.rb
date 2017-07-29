class Question < ApplicationRecord
  belongs_to :drill_group
  belongs_to :user

  has_many :answers, dependent: :destroy
  has_many :users_questions, dependent: :destroy

  validates(:title, { presence: { message: 'required' },
    uniqueness: true
    })

  validates(:description, { presence: true, length: { minimum: 5, maximum: 2000 }})
end
