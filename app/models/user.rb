class User < ApplicationRecord
  has_secure_password


  has_many :questions, dependent: :nullify

  has_many :badges, dependent: :destroy

  has_many :drills, dependent: :nullify

  has_many :questions
  has_many :user_badges, dependent: :destroy
  #has_many :answers, optional: true  #admin only
  has_many :answers
  has_many :drill_groups #admin only


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates(:email, { presence: true,
    uniqueness: {case_sensitive: false},
    format: VALID_EMAIL_REGEX
    })

  validates :first_name, :last_name, presence: true

  validates :username, presence: true, uniqueness: true

  before_save :set_defaults

  def full_name
    "#{first_name} #{last_name}"
  end

  def set_defaults
    self.total_pts ||= 0
    self.is_admin ||= false
  end

end
