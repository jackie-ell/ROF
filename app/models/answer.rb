class Answer < ApplicationRecord
  belongs_to :question, optional: true   #test for later
  belongs_to :user, optional: true

  validates :body, presence: true
end
