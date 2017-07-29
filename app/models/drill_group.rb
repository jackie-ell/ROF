class DrillGroup < ApplicationRecord
  has_many :questions, dependent: :destroy
  # belongs_to :user, optional: true
  belongs_to :user

  validates :category, presence: true, uniqueness: true
  validates :description, presence: true
  validates :difficulty, presence: true
end
