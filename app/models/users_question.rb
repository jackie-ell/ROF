class UsersQuestion < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :question, optional: true
end
