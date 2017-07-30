class DrillGroup < ApplicationRecord

  has_many :questions, dependent: :nullify
  belongs_to :user, optional: true
  #has_many :drills, dependent: :nullify

  has_many :questions, dependent: :destroy

  validates :category, presence: true, uniqueness: true
  validates :description, presence: true
  validates :difficulty, presence: true

end
