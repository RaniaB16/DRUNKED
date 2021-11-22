class Beverage < ApplicationRecord
  belongs_to :meeting
  belongs_to :drink
end
