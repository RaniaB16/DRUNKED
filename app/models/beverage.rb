class Beverage < ApplicationRecord
  belongs_to :meeting
  belongs_to :drink
  validates :drink, presence: true
end
