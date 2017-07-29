class Drill < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :drill_group, optional: true
end
