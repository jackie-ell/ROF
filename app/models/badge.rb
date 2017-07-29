class Badge < ApplicationRecord
  belongs_to :user, optional: true

  validates :badge_name, presence: true, uniqueness: true
  validates :threshhold, presence: true
  validates :t_value, presence: true
end
