class User < ApplicationRecord
  has_secure_password

  has_many :questions
  has_many :badges

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
