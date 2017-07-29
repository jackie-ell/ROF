class DrillGroup < ApplicationRecord

  has_many :questions, dependent: :nullify
  belongs_to :user, optional: true
  has_many :drills, dependent: :nullify

  has_many :questions, dependent: :destroy
  belongs_to :user, optional: true

  # validates :category, presence: true
  # validates :description, presence: true
  # validates :difficulty, presence: true

end
