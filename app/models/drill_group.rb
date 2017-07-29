class DrillGroup < ApplicationRecord
  has_many :questions, dependent: :nullify
  belongs_to :user, optional: true
end
