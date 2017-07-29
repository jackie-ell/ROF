class DrillGroup < ApplicationRecord
  has_many :questions, dependent: :nullify
  belongs_to :user, optional: true
  has_many :drills, dependent: :nullify
end
