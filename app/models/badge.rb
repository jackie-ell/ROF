class Badge < ApplicationRecord
  belongs_to :user, optional: true
end
