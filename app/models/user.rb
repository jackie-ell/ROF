class User < ApplicationRecord
  has_secure_password


  has_many :questions, dependent: :nullify
  has_many :badges, dependent: :nullify
  has_many :drills, dependent: :nullify

  has_many :questions
  has_many :user_badges, dependent: :destroy
  has_many :answers  #admin only
  has_many :drill_groups #admin only


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates(:email, { presence: true,
    uniqueness: {case_sensitive: false},
    format: VALID_EMAIL_REGEX
    })

  validates :first_name, :last_name, presence: true

  validates :username, presence: true, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
