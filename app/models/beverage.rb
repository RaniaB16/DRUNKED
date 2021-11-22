class Beverage < ApplicationRecord
  belongs_to :meeting_id
  belongs_to :drink_id
end
