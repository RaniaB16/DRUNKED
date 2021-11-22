class Drink < ApplicationRecord
  has_many :beverages
  validates :brand, presence: true
  validates :quantity, presence: true
  validates :alcool_type, presence: true
  validates :alcool_degree, presence: true
end
