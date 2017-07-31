class Badge < ApplicationRecord

  belongs_to :user
  has_many :user_badges, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :threshhold, presence: true
  validates :t_value, presence: true
end
